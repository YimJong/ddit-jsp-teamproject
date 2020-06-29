<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
// 구글 차트 API 및 Sample
// https://google-developers.appspot.com/chart/interactive/docs/index
// https://developers.google.com/chart

// =================== pieChart, BarChart, BubbleChart, CandleStickChart 공통 설정 시작 ======
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
// =================== pieChart, BarChart, BubbleChart, CandleStickChart 공통 설정 끝 ======
	function drawChart() {
		// 파이차트
		var pie_data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
				[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);
		var pieChartOptions = {
			title : 'Pie Chart'
		};
		var pieChart = new google.visualization.PieChart(document
				.getElementById('pieChart_div'));
		pieChart.draw(pie_data, pieChartOptions);
		
		// 파이차트 이벤트 처리
		google.visualization.events.addListener(pieChart, 'select', function(){
			var indexObj = pieChart.getSelection();
			// 파이차트에서 각 차트 선택시의 인덱스 취득
			alert('pie char selected.. : ' + indexObj[0].row);
		});
		google.visualization.events.addListener(pieChart, 'onmouseover', function(){
			alert('pie char onmouseover..');
		});
		google.visualization.events.addListener(pieChart, 'onmouseout', function(){
			alert('pie char onmouseout..');
		});

		// 바 차트
		var bar_data = google.visualization.arrayToDataTable([
				[ 'Year', 'Sales', 'Expenses' ], [ '2004', 1000, 400 ],
				[ '2005', 1170, 460 ], [ '2006', 660, 1120 ],
				[ '2007', 1030, 540 ] ]);
		
		var barChartOptions = {
			title : 'Bar Chart',
			hAxis : {
				title : 'Year',
				titleTextStyle : {
					color : 'Blue'
				}
			}
		};
		var barChart = new google.visualization.BarChart(document
				.getElementById('barChart_div'));
		
		// 바차트 이벤트 처리 : 차트 준비 이벤트시 해당 로우와 컬럼 셀렉션 처리
		google.visualization.events.addListener(barChart, 'ready', function(){
			barChart.setSelection([{row:0, column:1}]);
		});
		
		// 바차트 이벤트 처리 : 마우스 선택 이벤트 발생에따른 로우 컬럼 취득
		google.visualization.events.addListener(barChart, 'select', function(){
			var selection = barChart.getSelection();
			var message = '취득실패';
			for(var i=0; i<selection.length; i++){
				var item = selection[i];
				if(item.row != null && item.column != null){
					message = '{row : ' + item.row + ', column : ' + item.column + '}';
				}else if(item.row != null){
					message = '{row : ' + item.row + '}';
				}else if(item.column != null){
					message = '{row : ' + item.column + '}';
				}
			}
			alert(message);
		});

		barChart.draw(bar_data, barChartOptions);
		
		// 버블 차트
		var bubble_data = google.visualization.arrayToDataTable([
				[ 'ID', 'Life Expectancy', 'Fertility Rate', 'Region',
						'Population' ],
				[ 'CAN', 80.66, 1.67, 'North America', 33739900 ],
				[ 'DEU', 79.84, 1.36, 'Europe', 81902307 ],
				[ 'DNK', 78.6, 1.84, 'Europe', 5523095 ],
				[ 'EGY', 72.73, 2.78, 'Middle East', 79716203 ],
				[ 'GBR', 80.05, 2, 'Europe', 61801570 ],
				[ 'IRN', 72.49, 1.7, 'Middle East', 73137148 ],
				[ 'IRQ', 68.09, 4.77, 'Middle East', 31090763 ],
				[ 'ISR', 81.55, 2.96, 'Middle East', 7485600 ],
				[ 'RUS', 68.6, 1.54, 'Europe', 141850000 ],
				[ 'USA', 78.09, 2.05, 'North America', 307007000 ] ]);
		var bubble_options = {
			title : '버블차트',
			hAxis : {
				title : 'Life Expectancy'
			},
			vAxis : {
				title : 'Fertility Rate'
			},
			bubble : {
				textStyle : {
					fontSize : 11
				}
			}
		};
		var bubble_chart = new google.visualization.BubbleChart(document
				.getElementById('bubbleChart_div'));
		bubble_chart.draw(bubble_data, bubble_options);

		// 캔들스틱 차트
		// 캔들스틱 데이터 전역변수 선언
		candleStick_data1 = google.visualization.arrayToDataTable([
				[ 'Mon', 20, 28, 38, 45 ], [ 'Tue', 31, 38, 55, 66 ],
				[ 'Wed', 50, 55, 77, 80 ], [ 'Thu', 77, 77, 66, 50 ],
				[ 'Fri', 68, 66, 22, 15 ] ], true);
		candleStick_data2 = google.visualization.arrayToDataTable([
				[ 'Mon', 31, 38, 55, 66 ], [ 'Tue', 68, 66, 22, 15 ],
				[ 'Wed', 77, 77, 66, 50 ], [ 'Thu', 50, 55, 77, 80 ],
				[ 'Fri', 20, 28, 38, 45 ] ], true);
		
		
		candleStick_options = {
			animation : {
				duration : 2000,
				easing : 'out' // in, linear, inAndOut 
			},
			legend : 'none'
		};
		candleStick_chart = new google.visualization.CandlestickChart(
				document.getElementById('candleStickChart_div'));
		
		google.visualization.events.addListener(candleStick_chart, 'select', function(){
			var selection = candleStick_chart.getSelection();
			var message = '취득실패';
			for(var i=0; i<selection.length; i++){
				var item = selection[i];
				if(item.row != null && item.column != null){
					message = '{row : ' + item.row + ', column : ' + item.column + '}';
				}else if(item.row != null){
					message = '{row : ' + item.row + '}';
				}else if(item.column != null){
					message = '{row : ' + item.column + '}';
				}
			}
			alert(message);
			changeCandleStickData();
		});
		
		candleStick_chart.draw(candleStick_data1, candleStick_options);
	}
	
	var cnt = 0;
	
	function changeCandleStickData(){
		cnt++;
		
		if(cnt%2 == 0){
			candleStick_chart.draw(candleStick_data2, candleStick_options);
		}else{
			candleStick_chart.draw(candleStick_data1, candleStick_options);
		}
	}
	
// =================== GaugeChart 공통 설정 시작 ======	
	google.load('visualization', '1', {packages:['gauge']});
	google.setOnLoadCallback(gaugeDraw);
// =================== GaugeChart 공통 설정  끝 ======	
	function gaugeDraw(){
		// gauges Chart
		// gauges_data 전역변수 설정
		memoryValue = 10;
		
		// data 인덱스
		// 0       0 0     0 1
		//     [ 'Memory', 10 ]
		// 1      1 0   1 1
		//     [ 'CPU', 55 ]
		// 2      2 0       2 1
		//     [ 'Network', 68 ]
		gauges_data = google.visualization.arrayToDataTable([[ 'Label', 'Value' ], 
		                                                     [ 'Memory', 10 ], [ 'CPU', 55 ],
				                                             [ 'Network', 68 ]]);
		// gauges_options 전역변수 설정
		gauges_options = {
			width : 400,
			height : 120,
			redFrom : 90,
			redTo : 100,
			yellowFrom : 75,
			yellowTo : 90,
			greenFrom : 50,
			greenTo : 75,
			minorTicks : 5,
			min : 0,
			max : 100
		};
		// gauges_chart 전역변수 설정		
		gauges_chart = new google.visualization.Gauge(document.getElementById('gaugesChart_div'));        

		gauges_chart.draw(gauges_data, gauges_options);	
	}
	
	// 게이지 차트는 이벤트가 없어서 게이지 증가 감소 버튼 생성함.
	function gaugeIncrement(){
		// 현재 게이지 값 취득
		var message = gauges_data.getValue(0, 1);
		message +=  ' / ' + gauges_data.getValue(1, 1);
		message +=  ' / ' + gauges_data.getValue(2, 1);
		
		// 신규 게이지 값 설정
		gauges_data.setValue(0, 1, memoryValue = memoryValue+1);
		gauges_data.setValue(1, 1, memoryValue = memoryValue+5);
		gauges_data.setValue(2, 1, memoryValue = memoryValue+10);
		gauges_chart.draw(gauges_data, gauges_options);
		
		alert(message);
	}
	function gaugeDecrement(){
		gauges_data.setValue(0, 1, memoryValue = memoryValue-1);
		gauges_data.setValue(1, 1, memoryValue = memoryValue-5);
		gauges_data.setValue(2, 1, memoryValue = memoryValue-10);
		gauges_chart.draw(gauges_data, gauges_options);
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="pieChart_div" style="width: 500px; height: 300px;"></div>
	<div id="barChart_div" style="width: 500px; height: 300px;"></div>
	<div id="areaChart_div" style="width: 500px; height: 300px;"></div>
	<div id="bubbleChart_div" style="width: 500px; height: 300px;"></div>
	<div id="candleStickChart_div" style="width: 500px; height: 300px;"></div>
	<div id="gaugesChart_div" style="width: 500px; height: 300px;"></div>
	<div>
		<input type="button" value="게이지 증가" onclick="gaugeIncrement();">
		<input type="button" value="게이지 감소" onclick="gaugeDecrement();"><br/>
	</div>
</body>
</html>