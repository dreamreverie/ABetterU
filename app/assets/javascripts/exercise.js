$(document).ready(function() {
  $('#exercise_workout_date').datepicker({ dateFormat: 'yy-mm-dd' });

Morris.Area({
// ID of the element in which to draw the chart.
  element: 'line-chart',
// Chart data records -- each entry in this array corresponds to a point on
// the chart.
  data: $('#line-chart').data('workouts'),
// The name of the data record attribute that contains x-values. xkey: 'workout_date',
// A list of names of data record attributes that contain y-values. ykeys: ['duration_in_mins'],

// Labels for the ykeys -- will be displayed when you hover over the // chart.
  xkey: 'workout_date',
  ykeys: ['duration_in_min'],
  labels: ['Duration (min)'],
  lineColors: ['#2D9C2F'],
  pointFillColors: ['#ff9900'],
  xLabels: "day",
  xLabelAngle: 0,

  xLabelFormat: function (x) {
date_string = parseInt(x.getMonth() + 1) + "-" + x.getDate();
return date_string;
  },
  yLabelFormat: function(y) { return y + ' min'; }
  });
});
//------------------------------------------------------------
//Morris.Donut({
//  element: 'donut-chart',
//data: $('#donut-chart').data('workouts'),
//  labels: ['Duration (min)'],
//  lineColors: ['#2D9C2F'],
//  pointFillColors: ['#ff9900'],
//
//});
