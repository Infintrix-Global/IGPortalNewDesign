using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IG_Portal.BAL_Classes
{
    
    //    public class ParentMenuID
    //    {
    //        public int MenuID { get; set; }
    //        public string ParentID { get; set; }
    //        public int DisplayRank
    //        {
    //            get;
    //            set;
    //        }
    //        public string MenuText { get; set; }
    //        public string MenuDescription { get; set; }
    //        public string Navigation_URL { get; set; }
    //        public bool IsActive { get; set; }
    //        public bool DisplayInMenu { get; set; }
    //        public int MenuLevel { get; set; }
    //        public string MenuIcon { get; set; }

    //        public ParentMenuID() { }

    //        public ParentMenuID(int MenuID, string ParentID, int DisplayRank, string MenuText, string MenuDescription, string Navigation_URL, bool IsActive, bool DisplayInMenu, int MenuLevel, string MenuIcon)
    //        {
    //            this.MenuID = MenuID;
    //            this.ParentID = ParentID;
    //            this.DisplayRank = DisplayRank;
    //            this.MenuText = MenuText;
    //            this.MenuDescription = MenuDescription;
    //            this.Navigation_URL = Navigation_URL;
    //            this.IsActive = IsActive;
    //            this.DisplayInMenu = DisplayInMenu;
    //            this.MenuLevel = MenuLevel;
    //            this.MenuIcon = MenuIcon;
    //        }


    //    }
    //public class MenuMasterBAL
    //{
    //    public static IEnumerable<MenuMaster_Tbl> GetParentMenuID()
    //    {
    //        using (var modelObject = new IGPortal())
    //        {
    //            var query = from mm in modelObject.MenuMaster_Tbl
    //                        where mm.ParentID == null && mm.IsActive == true
    //                        orderby mm.DisplayRank
    //                        select mm;
    //            return query.ToList();
    //        }

    //    }

    //    public static List<ParentMenuID> GetRoleWiseMenu(string MenuID, int RoleID)
    //    {
    //        IGPortal modelobject = new IGPortal();

    //        var menulist = (from rma in modelobject.tblRoleMenuAccesses
    //                        join mm in modelobject.MenuMaster_Tbl
    //                        on rma.MenuID equals mm.MenuID
    //                        where rma.RoleID == RoleID && mm.ParentID == MenuID && rma.IsActiveAllowed == true && mm.IsActive == true
    //                        select new ParentMenuID
    //                        {
    //                            MenuID = mm.MenuID,
    //                            ParentID = mm.ParentID,
    //                            DisplayRank = mm.DisplayRank,
    //                            MenuText = mm.MenuText,
    //                            MenuDescription = mm.MenuDescription,
    //                            Navigation_URL = mm.Navigation_URL,
    //                            IsActive = mm.IsActive,
    //                            DisplayInMenu = mm.DisplayInMenu,
    //                            MenuLevel = mm.MenuLevel,
    //                        });

    //        return menulist.OrderBy(x => x.DisplayRank).ToList();
    //    }
    //}
}