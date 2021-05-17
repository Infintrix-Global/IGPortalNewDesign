"use strict";


var draw = Chart.controllers.line.prototype.draw;
Chart.controllers.lineShadow = Chart.controllers.line.extend({
    draw: function() {
        draw.apply(this, arguments);
        var ctx = this.chart.chart.ctx;
        var _stroke = ctx.stroke;
        ctx.stroke = function() {
            ctx.save();
            ctx.shadowColor = '#00000075';
            ctx.shadowBlur = 10;
            ctx.shadowOffsetX = 8;
            ctx.shadowOffsetY = 8;
            _stroke.apply(this, arguments)
            ctx.restore();
        }
    }
});


var ctx = document.getElementById("myChart2").getContext('2d');
var myChart = new Chart(ctx, {
  type: 'horizontalBar',
  data: {
    labels: ["Moni", "Raj", "Vishnu", "Reddy","Uvraj"],
    datasets: [{
      label: 'Statistics',
      data: [450, 360, 320, 532, 310],
      borderWidth: 1,
      backgroundColor: 'rgba(77,181,249,.2)',
      borderColor: '#4DB5F9',
      borderWidth: 1,
      pointBackgroundColor: '#ffffff',
      pointRadius: 4
    }]
  },
  options: {
    legend: {
      display: false
    },
    scales: {
      yAxes: [{
        gridLines: {
          drawBorder: false,
          color: '#f2f2f2',
        },
        ticks: {
          beginAtZero: true,
          stepSize: 150
        }
      }],
      xAxes: [{
        ticks: {
          display: false
        },
        gridLines: {
          display: false
        }
      }]
    },
  }
});

