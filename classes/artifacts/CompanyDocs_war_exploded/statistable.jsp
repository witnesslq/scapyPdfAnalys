<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="author" content="">
  <meta name="keywords" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>数据统计-表格统计</title>
  <link rel="stylesheet" type="text/css"
        href="static/css/bootstrap.min.css">
  <script src="static/js/jquery-1.11.2.min.js"></script>
  <style type="text/css">
    .search {
      left: 0;
      position: relative;
    }

    #auto_div {
      display: none;
      width: 195px;
      border: 1px #74c0f9 solid;
      background: #FFF;
      color: #323232;
      z-index: 999;
      height: 300px;
      overflow: auto;
    }

    .glyphicon:hover {
      cursor: pointer;
    }

    p.flip {
      cursor: pointer;
      margin: 0px;
      padding: 5px;
      text-align: center;
      background: #ffffff;
      border: solid 1px #c3c3c3;
    }

    div.panel {
      margin: 5px;
      border: solid 1px #c3c3c3;
      padding: 5px;
      display: none;
      background: #fdfff4
    }
  </style>
</head>
<body>

<%@ include file="public_jsp/public_nav.jsp" %>

<div class="row"
     style="width: 100%; height: 600px; height: auto !important; min-height: 600px;">
  <div class="col-md-2" style="margin-top: 40px;">
    <ul class="nav nav-pills nav-stacked">
      <li class="active text-center"><a href="statistable.jsp">表格数据</a></li>
    </ul>

    <ul class="nav nav-pills nav-stacked">
      <hr/>
      <li class="text-center" style="font-size: 1.2em">图形统计</li>
      <li class="text-center"><a href="statisbar.jsp">坐标图</a></li>
      <li class="text-center"><a href="statisline.jsp">折线图</a></li>
      <li class="text-center"><a href="statispie.jsp">扇形图</a></li>
    </ul>
  </div>
  <div class="col-md-10">
    <form class="form-inline">
      <div class="panel">

      </div>
      <div id="one">
        <div class="form-group">
          <label for="company_name" class="control-label">选择公司一:&nbsp;&nbsp;&nbsp;</label>

          <div class="input-group">
            <input type="text" class="form-control" id="company_name"
                   placeholder="输入公司名">

            <div id="auto_div"></div>
          </div>
        </div>
        <div class="form-group">
          <select id="tableType" class="form-control">
            <option value="">--表格类型--</option>
            <option value="1">资产负载表</option>
            <option value="2">利润表</option>
            <option value="3">现金流量表</option>
            <!--<option value="4">所有者权益变动表</option> -->
          </select>
        </div>
        <div class="form-group">
          <select id="tablePart" class="form-control">
            <option value="">--请选择--</option>
          </select>
        </div>
        <div class="form-group">
          <select id="year" class="form-control">
            <option value="">--请选择--</option>
          </select>
        </div>
        <div class="form-group">
          <p class="flip">选择表格项</p>
        </div>
        <div class="form-group">
          <select id="companyType" class="form-control">
            <option value="self">子公司</option>
            <option value="parent">母公司</option>
          </select>
        </div>
        <div class="form-group">
          <button id="filter" class="btn btn-default" type="button">确定</button>
        </div>
      </div>
      <div id="two" style="display: none">
        <div class="form-group">
          <label for="company_name" class="control-label">选择公司二:&nbsp;&nbsp;&nbsp;</label>

          <div class="input-group">
            <input type="text" class="form-control" id="company_name"
                   placeholder="输入公司名">

            <div id="auto_div"></div>
          </div>
        </div>
      </div>
      <div id="three" style="display: none">
        <div class="form-group">
          <label for="company_name" class="control-label">选择公司三:&nbsp;&nbsp;&nbsp;</label>

          <div class="input-group">
            <input type="text" class="form-control" id="company_name" placeholder="输入公司名"/>
            <div id="auto_div"></div>
          </div>
        </div>
      </div>
      &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-minus-sign"
                              aria-hidden="true"></span> <span
            class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>

    </form>

    <br/>

    <div>
      <table id="tableArea"
             class="table table-striped table-bordered table-hover"
             cellspacing="0" width="100%">

      </table>
    </div>
  </div>
</div>
<!-- 中间容器结束 -->

<%@ include file="public_jsp/public_footer.jsp" %>


<script type="text/javascript">
  <%--选择表格项--%>
  var flag = 1;
  $("#tablePart").change(function(){
    var companyName = $("#one").find("#company_name").val();
    var tablePart = $("#tablePart option:selected").val();
    var tableType = $("#tableType option:selected").val();
    if(companyName!=""&&tablePart!=""&&tableType!="")
    {
      $.ajax({
        type: "post",
        async: false, //同步执行
        url: "statis.do",
        data: {
          "action": "getTableColumns",
          "companyName": companyName,
          "tableType": tableType,
          "tablePart": tablePart
        },
        dataType: "json", //返回数据形式为json
        success: function (result) {
          if (result.success) {
            $(".panel").empty();
            $(result.jsonString).each(function(){
              var option = "<label>";
              option += "<input type='checkbox' value='" + this.id + "'/>" + this.name +
                      "</label>&nbsp;&nbsp;&nbsp;";
              $(".panel").append(option);
            });
          } else {
            alert(result.errorMsg);
          }
        },
        error: function () {
          alert("暂没有相关数据!");
        }
      });
    }
  });
  $(".flip").click(function () {
    if (0 == flag) {
      $(".panel").slideUp("10000");
      flag = 1;
    }
    else {
      $(".panel").slideDown("10000");
      flag = 0;
    }
  });

  //测试用的数据
  var company_list = new Array();
  var old_value = "";
  var highlightindex = -1; //高亮
  //自动完成
  function AutoComplete(obj, auto, search, mylist) {
    if ($(obj).val() != old_value || old_value == "") {
      var autoNode = $("#" + auto); //缓存对象（弹出框）
      var carlist = new Array();
      var n = 0;
      old_value = $(obj).val();
      for (i in mylist) {
        if (mylist[i].indexOf(old_value) >= 0) {
          carlist[n++] = mylist[i];
        }
      }
      if (carlist.length == 0) {
        autoNode.hide();
        return;
      }
      autoNode.empty();
      for (i in carlist) {
        var wordNode = carlist[i]; //弹出框里的每一条内容
        var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值
        newDivNode.attr("style", "font:14px/25px;height:25px;padding:0 8px;cursor: pointer;");
        newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框
        //鼠标移入高亮，移开不高亮
        newDivNode.mouseover(function () {
          if (highlightindex != -1) { //原来高亮的节点要取消高亮（是-1就不需要了）
            autoNode.children("div").eq(highlightindex).css(
                    "background-color", "white");
          }
          //记录新的高亮节点索引
          highlightindex = $(this).attr("id");
          $(this).css("background-color", "#ebebeb");
        });
        newDivNode.mouseout(function () {
          $(this).css("background-color", "white");
        });
        //鼠标点击文字上屏
        newDivNode.click(function () {
          //取出高亮节点的文本内容
          var comText = autoNode.hide().children("div").eq(highlightindex).text();
          highlightindex = -1;
          //文本框中的内容变成高亮节点的内容
          $(obj).val(comText);
        })
        if (carlist.length > 0) { //如果返回值有内容就显示出来
          var offsettop = $(obj).offset().top;
          var offsetleft = $(obj).offset().left;
          autoNode.css({position: "fixed", 'top': offsettop + 34, 'left': offsetleft});
          autoNode.show();
        } else { //服务器端无内容返回 那么隐藏弹出框
          autoNode.hide();
          //弹出框隐藏的同时，高亮节点索引值也变成-1
          highlightindex = -1;
        }
      }
    }
    //点击页面隐藏自动补全提示框
    document.onclick = function (e) {
      var e = e ? e : window.event;
      var tar = e.srcElement || e.target;
      if (tar.id != search) {
        if ($("#" + auto).is(":visible")) {
          $("#" + auto).css("display", "none")
        }
      }
    }
  }
  function getCompanyList(obj)
  {
    var value=$(obj).val();
    $.ajax({
      type: "post",
      async: false, //同步执行
      url: "statis.do",
      data: {"action": "getCompanyList","value":value},
      dataType: "json", //返回数据形式为json
      success: function (result) {
        //myChart.hideLoading();
        if (result) {
          company_list=[];
          for (var temp in result) {
            company_list.push(result[temp]['code']+"-"+result[temp]['name']);
          }
        }
      },
      error: function (errorMsg) {
        alert("数据加载失败，请重试");
      }
    });
  }
  $(function () {
    old_value = $("#company_name").val();
    $("[id=company_name]").focus(function () {
      getCompanyList(this);
      AutoComplete(this, "auto_div", "company_name", company_list);
    });
    $("[id=company_name]").keyup(function () {
      getCompanyList(this);
      AutoComplete(this, "auto_div", "company_name", company_list);
    });


    //获取表格部分的列表
    $("[id=tableType]").change(function () {
      var companyName = $(this).parent().prev().children().children().val()
      var tableType = $(this).children(":selected").val();
      $(this).parent().next().children("#tablePart").empty();
      var tablePartSelect = $(this).parent().next().children("#tablePart");
      tablePartSelect.append("<option value=''>--请选择--</option>");
      $.ajax({
        type: "post",
        async: false, //同步执行
        url: "statis.do",
        data: {
          "action": "getTablePartList",
          "companyName": companyName,
          "tableType": tableType
        },
        dataType: "json", //返回数据形式为json
        success: function (result) {
          if (result.success) {
            $(result.jsonString).each(function () {
              tablePartSelect.append("<option value='" + this.id + "'>" + this.name + "</option>");
            });
          } else {
            alert(result.errorMsg);
          }
        },
        error: function (errorMsg) {
          alert("服务器连接失败,请重试!");
        }
      });
    });
    //生成年份下拉框
    var myDate = new Date();
    for (var i = myDate.getFullYear(); i >= 2005; i--) {
      $("#year").append("<option value='" + i + ".1'>" + i + "--上半年</option>");
      $("#year").append("<option value='" + i + ".2'>" + i + "--下半年</option>");
    }

    //减少公司按钮
    $(".glyphicon-minus-sign").click(function () {
      $(this).prevAll().not(":hidden").not(".panel").not("#one").first().hide();
    });
    //增加公司按钮
    $(".glyphicon-plus-sign").click(function () {
      $(this).prevAll().filter(":hidden").not(".panel").last().show();
    });
    //获取表格数据
    $("#filter").click(function () {
      var companyName = "";
      var tableType = "";
      var tablePart = "";
      var year = "";
      var status = "";
      var temp = 0;
      var tableColumus="";
      var companyType="self";
      companyType=$("#companyType option:selected").val();
      $(this).parent().parent().parent().children().not(":hidden").not("span").not(".panel").each(function () {

        if (temp == 0)
          companyName = $(this).eq(0).find("#company_name").val();
        else
          companyName = companyName + "," + $(this).eq(0).find("#company_name").val();
        temp++;
      });
      temp=0;
      $(".panel").find("input:checkbox:checked").each(function(){
        if(temp==0)
          tableColumus=$(this).val();
        else
          tableColumus=tableColumus+","+$(this).val();
        temp++;
      });

      tablePart = $("#tablePart option:selected").val();
      tableType = $("#tableType option:selected").val();
      year = $("#year option:selected").val();
      year_status = year.split(".");
      year = year_status[0];
      status = year_status[1];
      if (companyName == "") {
        alert("请选择公司!");
      } else if (tableType == "") {
        alert("请选择表格类型");
      } else if (tablePart == "") {
        alert("请选择需要显示的表部分");
      } else if (year == "") {
        alert("请选择年份");
      } else {
        $.ajax({
          type: "post",
          async: true, //同步执行
          url: "statis.do",
          data: {
            "action": "getTable",
            "companyName": companyName,
            "tableType": tableType,
            "tablePart": tablePart,
            'year': year,
            "status": status,
            'tableColumns':tableColumus,
            'companyType':companyType
          },
          dataType: "json", //返回数据形式为json
          success: function (result) {
            if (result.success) {
              $("#tableArea").empty();
              var lineData = "<tr>";
              for (var index in result.jsonString.tableheadArr) {
                lineData += "<th>" + result.jsonString.tableheadArr[index] + "</th>";
              }
              lineData += "</tr>";
              $("#tableArea").html(lineData);
              for (var index1 in result.jsonString.data) {
                lineData = "<tr>";
                for (var index2 in result.jsonString.data[index1]) {
                  lineData += "<td>" + result.jsonString.data[index1][index2] + "</td>";
                }
                lineData += "</tr>";
                $("#tableArea").append(lineData);
              }
            } else {
              alert(result.errorMsg);
            }
          },
          error: function () {
            alert("暂没有相关数据!");
          }
        });
      }
    });
  });
</script>
<script src="static/js/bootstrap.min.js"></script>
</body>
</html>