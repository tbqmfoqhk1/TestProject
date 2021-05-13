<%--
	회원가입 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>

<style>
    .chart--container {
      height: 100%;
      width : 50%;
      min-height: 530px;
    }

    .zc-ref {
      display: none;
    }
    #myChart {
    	margin : auto;
    	border-radius: 99.5px;
    	background-color: #003849;
    	border-right: 1px solid #c8c8c8;
    	border-left: 1px solid #c8c8c8;
    }
    
    h2 {
    	    font-family: monospace;
    		text-align: center;
    }
  </style>
  <h2>"Daily Weather"</h2><br/><br/>
  <div id="myChart" class="chart--container">
	<a href="https://www.zingchart.com/" rel="noopener" class="zc-ref">Powered by ZingChart</a>
	<span id="dataset"></span>
	
</div>
 <script>

    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"]; // DEFINE DATA
    // -----------------------------
    let chartData = [
      {
        text: '기온',
        values: [${array_minTemp[0]}],
        legendMarker: {
          type: 'circle',
          backgroundColor: '#da534d',
          borderColor: '#faa39f',
          borderWidth: '1px',
          shadow: false,
          size: '5px'
        },
        lineColor: '#da534d',
        marker: {
          backgroundColor: '#da534d',
          borderColor: '#faa39f',
          borderWidth: '1px',
          shadow: false
        }
      }
    ];

    // CHART CONFIG
    // -----------------------------
    let chartConfig = {
      type: 'line',
      theme: 'classic',
      backgroundColor: '#003849',
      utc: true,
      title: {
        text: '이번주 기온',
        backgroundColor: '#003849',
        fontColor: 'white',
        fontSize: '24px',
        height: '25px',
        y: '7px'
      },
      legend: {
        align: 'center',
        backgroundColor: 'none',
        borderWidth: '0px',
        item: {
          fontColor: '#f6f7f8',
          fontSize: '14px'
        },
        layout: 'float',
        offsetY: '35px',
        shadow: false,
        textAlign: 'middle'
      },
      plot: {
        hoverMarker: {
          type: 'circle',
          borderWidth: '1px',
          size: '4px'
        },
        lineWidth: '3px',
        marker: {
          type: 'circle',
          size: '3px'
        },
        shadow: false,
        tooltipText: '%t views: %v<br>%k'
      },
      plotarea: {
        margin: '20% 8% 14% 12%',
        backgroundColor: '#003849'
      },
      scaleX: {
    	    guide: {
    	      lineColor: '#f6f7f8'
    	    },
    	    item: {
    	      fontColor: '#f6f7f8'
    	    },
    	    label: {
    	      visible: false
    	    },
    	    lineColor: '#f6f7f8',
    	    minorTicks: 0,
    	    minValue: ${array_date[0]},
    	    shadow: false,
    	    step: 21600000,
    	    tick: {
    	      lineColor: '#f6f7f8'
    	    },
    	    transform: {
    	      type: 'date',
    	      all: '%y-%m-%d<br />%h:%i %A',
    	      guide: {
    	        visible: false
    	      },
    	      item: {
    	        visible: false
    	      }
    	    }
    	  },
      scaleY: {
        values: '-10:40:10',
        guide: {
          lineColor: '#f6f7f8',
          lineStyle: 'dashed'
        },
        item: {
          fontColor: '#f6f7f8'
        },
        label: {
          text: '기온',
          fontColor: '#f6f7f8'
        },
        lineColor: '#f6f7f8',
        minorTicks: 0,
        shadow: false,
        thousandsSeparator: ',',
        tick: {
          lineColor: '#f6f7f8'
        }
      },
      crosshairX: {
        lineColor: '#f6f7f8',
        plotLabel: {
          padding: '10px',
          borderColor: '#f6f7f8',
          borderRadius: '5px',
          borderWidth: '1px',
          fontWeight: 'bold'
        },
        scaleLabel: {
          backgroundColor: '#f6f7f8',
          borderRadius: '5px',
          fontColor: '#00baf0'
        }
      },
      tooltip: {
        visible: false
      },
      series: chartData
    };

    // RENDER CHARTS
    // -----------------------------
    zingchart.render({
      id: 'myChart',
      data: chartConfig
    });
  </script>
 <br/><br/> 
  <%@ include file="../pages/footer.jsp" %>