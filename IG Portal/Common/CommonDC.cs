﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text.RegularExpressions;
using System.Text;
using System.Web.Hosting;
using System.Configuration;


namespace IG_Portal
{
    public class CommonDC
    {
    }

    public class MultipartParser
    {
        private byte[] requestData;

        //Require Namespace: using System.IO;
        public MultipartParser(Stream stream)
        {
            ErrorMessage("MultipartParser entered");
            //Require Namespace: using System.Text;
            this.Parse(stream, Encoding.UTF8);
            ErrorMessage("this.Parse completed.");
            ParseParameter(stream, Encoding.UTF8);
            ErrorMessage("ParseParameter completed");
        }

        public MultipartParser(Stream stream, Encoding encoding)
        {
            this.Parse(stream, encoding);
        }





        private void Parse(Stream stream, Encoding encoding)
        {
            this.Success = false;
            ErrorMessage("Parse Entered");
            // Read the stream into a byte array
            byte[] data = ToByteArray(stream);

            requestData = data;

            // Copy to a string for header parsing
            string content = encoding.GetString(data);
           // ErrorMessage("content is=" + content);
            int delimiterEndIndex = content.IndexOf("\r\n");
          //  ErrorMessage("delimiterEndIndex" + delimiterEndIndex);
          //  ErrorMessage("delimiterEndIndex if will begin");
            if (delimiterEndIndex > -1)
            {
              //  ErrorMessage("delimiterEndIndex if entered");
                string delimiter = content.Substring(0, content.IndexOf("\r\n"));
                string z = content;

                Match ContentLength = null;
                List<string> TempList = new List<string>();
                string temp = "";
                do
                {
                    Regex rex = new Regex(@"(?<=Content\-Length: )(.*?)(?=\n)");
                    ContentLength = rex.Match(z);



                    if (ContentLength != null)
                    {
                        temp = "Content-Length: " + Convert.ToString(ContentLength);
                        TempList.Add(temp);

                        z = z.Replace(temp, string.Empty);
                    }

                }
                while (Convert.ToString(ContentLength.Value) != "");

                //Require Namespace: using System.Text.RegularExpressions;
                // Look for Content-Type
                Regex re = new Regex(@"(?<=Content\-Type:)(.*?)(?=\n)");
                //Regex re = new Regex(@"(?<=Content\-Type:)(.*?)");
                //Match contentTypeMatch = re.Match(content);
                Match contentTypeMatch = re.Match(content);

                // Look for filename
                re = new Regex(@"(?<=filename\=\"")(.*?)(?=\"")");
                Match filenameMatch = re.Match(content);

                // Did we find the required values?
                if (contentTypeMatch.Success && filenameMatch.Success)
                {
                    ErrorMessage("if entered");
                    // Set properties

                    this.Filename = filenameMatch.Value.Trim();
                    string cl = "multipart/form-data";
                    // Get the start & end indexes of the file contents
                    // int startIndex = filenameMatch.Index + filenameMatch.Length + "\r\n\r\n".Length;
                    int startIndex = TempList[TempList.Count - 2].Length + content.IndexOf(cl) + cl.Length + "\r\n\r\n".Length + 1;

                    byte[] delimiterBytes = encoding.GetBytes("\r\n" + delimiter);
                    int endIndex = IndexOf(data, delimiterBytes, startIndex);
                    ErrorMessage("endIndex=" + endIndex.ToString());
                    int contentLength = endIndex - startIndex;
                    byte[] fileData = new byte[contentLength];
                    Buffer.BlockCopy(data, startIndex, fileData, 0, contentLength);
                    ErrorMessage("data=" + data.ToString());
                    ErrorMessage("startIndex=" + startIndex);
                    ErrorMessage("contentLength=" + contentLength);
                    ErrorMessage("FileContents=" + fileData);
                    this.FileContents = fileData;
                    this.Success = true;
                }
            }
        }

        public static void ErrorMessage(string msg)
        {

            string ACPPath = HostingEnvironment.MapPath("~/log.txt"); //System.Configuration.ConfigurationManager.AppSettings["Log"];
            StreamWriter swExtLogFile = new StreamWriter(ACPPath, true);
            swExtLogFile.Write(Environment.NewLine);
            swExtLogFile.Write("*****Error message=****" + msg + " at " + DateTime.Now.ToString());
            swExtLogFile.Flush();
            swExtLogFile.Close();
        }
        private void ParseParameter(Stream stream, Encoding encoding)
        {

            this.Success = false;


            byte[] data;

            if (requestData.Length == 0)
            {
                data = ToByteArray(stream);
            }
            else
            {
                data = requestData;
            }


            string content = encoding.GetString(data);


            int delimiterEndIndex = content.IndexOf("\r\n");

            if (delimiterEndIndex > -1)
            {

                string delimiter = content.Substring(0, content.IndexOf("\r\n"));

                string[] splitContents = content.Split(new[] { delimiter }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string t in splitContents)
                {


                    Regex contentTypeRegex = new Regex(@"(?<=Content\-Type:)(.*?)(?=\r\n\r\n)");

                    Match contentTypeMatch = contentTypeRegex.Match(t);


                    Regex re = new Regex(@"(?<=name\=\"")(.*)");

                    Match name = re.Match(t);


                    re = new Regex(@"(?<=filename\=\"")(.*?)(?=\"")");

                    Match filenameMatch = re.Match(t);


                    if (name.Success || filenameMatch.Success)
                    {

                        int startIndex;

                        if (filenameMatch.Success)
                        {

                            this.Filename = filenameMatch.Value.Trim();

                        }
                        if (contentTypeMatch.Success)
                        {


                            startIndex = contentTypeMatch.Index + contentTypeMatch.Length + "\r\n\r\n".Length;

                        }
                        else
                        {

                            startIndex = name.Index + name.Length + "\r\n\r\n".Length;

                        }

                        string propertyData = t.Substring(startIndex - 1, t.Length - startIndex);


                        MyContent myContent = new MyContent();

                        myContent.Data = encoding.GetBytes(propertyData);

                        myContent.StringData = propertyData;

                        myContent.PropertyName = name.Value.Trim().TrimEnd('"');


                        if (MyContents == null)

                            MyContents = new List<MyContent>();

                        MyContents.Add(myContent);

                        this.Success = true;
                    }
                }
            }
        }

        private int IndexOf(byte[] searchWithin, byte[] serachFor, int startIndex)
        {
            int index = 0;
            int startPos = Array.IndexOf(searchWithin, serachFor[0], startIndex);

            if (startPos != -1)
            {
                while ((startPos + index) < searchWithin.Length)
                {
                    if (searchWithin[startPos + index] == serachFor[index])
                    {
                        index++;
                        if (index == serachFor.Length)
                        {
                            return startPos;
                        }
                    }
                    else
                    {
                        startPos = Array.IndexOf<byte>(searchWithin, serachFor[0], startPos + index);
                        if (startPos == -1)
                        {
                            return -1;
                        }
                        index = 0;
                    }
                }
            }
            return -1;
        }

        private byte[] ToByteArray(Stream stream)
        {
            byte[] buffer = new byte[32768];
            using (MemoryStream ms = new MemoryStream())
            {
                while (true)
                {
                    int read = stream.Read(buffer, 0, buffer.Length);
                    if (read <= 0)
                        return ms.ToArray();
                    ms.Write(buffer, 0, read);
                }
            }
        }

        public List<MyContent> MyContents { get; set; }

        public bool Success
        {
            get;
            private set;
        }

        public string ContentType
        {
            get;
            private set;
        }

        public string Filename
        {
            get;
            private set;
        }

        public byte[] FileContents
        {
            get;
            set;
        }
    }

    public class MyContent
    {
        public byte[] Data { get; set; }
        public string PropertyName { get; set; }
        public string StringData { get; set; }
    }

}