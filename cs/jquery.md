ready

`$(document).ready(function(){alert("�������");});`
ע���¼�����,����ͨ��dom������һ��,����Ҫ��Ԫ�صı�ǩ������on**�ȱ��

ready()��dom�е�onload����,����onloadֻ��ע��һ��,��ready()����ע����

$(document).ready(function () {alert("�������");});

$(document).ready(function () {alert("�������2");});
onload�������е�domԪ��,ͼƬ,css�ȶ�������Ϻ�Żᱻ����,��ready�����е�domԪ�ش�����Ϻ�ͻᱻ����,�������������ҳ����Ӧ�ٶ�

$(window).load()����ʵ��onload�����¼����õ�ʱ��
����ready()��������ܳ���,����jquery��������˼�, $(function () {alert("over");})

map

$.map(array,function)��array�е�ÿ��Ԫ�ص���function�������д���,�з���ֵ
each

$.each(array,function),û�з���ֵ

$.each(array,function(key,value){})
��ʹ��һ������ʱ,ָkey

����ʹ�ò���ʱ,����ʵ��this,���ʱ��thisָvalue
jquery�������ͨ��jquery��װ��dom����

jquery����ֻ�ܵ���jquery��װ�ķ���.���ܵ���dom����ķ���

���Խ�һ��dom����ת��Ϊjquery����

var div = document.getElementById("div1");
	   alert($(div).html());

��ע��,array��javascript���Ա���������,����dom����,���Բ���Ҫת��Ϊjquery����

ͬʱ,Ҳ���Խ�jquery����ת��Ϊdom����($(div)[0]����($(div).get(0)

jquery���������õ���ʽ����each����,������Լ�д�Ķ��������ʾ����each����

ע���¼�
```
$(function () {
	$("p").click(function(){
	  alert("i am is a p");
	});//��ʽ����,��ȡ����ÿ��p��ע��click�¼�
});
```

css
```
$(function () {$("#div1").css("background", "red");});
$(function () { alert($("#div1").css("backgroundColor")); });
```

class
```
attr("class")
attr("class","myclass")
```

addClass
removeClass
toggleClass �л���ʽ,���û��,������,�����,��ɾ��
hasClass �ж��Ƿ��������ʽ

filter:Gray�ڰ���ʽ

ѡ����

id/tagName/cssClassNameѡ����
```
$("#id ")/$("TagName")/$(".cssClassName")
```

����:
```
$(function(){
	$("p").click(function () { alert("i am is a p"); });//��ʽ����,��ȡ����ÿ��p��ע��click�¼�
});
```

������ѡ����
```
$("p,div,span.menuitem") ѡ�����е�p��ǩ,div��ǩ�ʹ���menuitem��ʽ��span��ǩ
```

ѡ��������ʽ�еĿո��ܶ�Ҳ������
���ѡ����

$("div li")��ȡdiv�µ�����liԪ��
$("div > li")��ȡdiv�µ�ֱ��liԪ��
$("body *")ѡȡbody�µ�����Ԫ��
$("#table img").not(this)

����ѡ����
:first ѡȡ��һ��Ԫ�� $("div:first")
:last
:not  $("input:not(.myclass)")ѡȡ����myclass��input
:event  :odd ѡȡ��ż��
:eq/:gt/:ltѡȡ�����ŵ���,����,С�ڵ�Ԫ��  $("input:lt(5)")
$(":header")
$("div:animated")ѡȡ����ִ�ж�����div

����ѡ�����������ʹ��,������ע��ÿһ�����˶�����ǰһ���Ĺ������ý����һ������

���Թ���ѡ����

$("div[id]")ѡȡ��id���Ե�div
$("div[title=test]")

������ѡ��ͷ/����/������,�������ʹ��

��������ѡ����

- `$("#form1 :enabled")`ѡȡidΪform1�ı������������õ�Ԫ��
- `$("#form1 :disabled")`ѡȡidΪform1�ı��������н��õ�Ԫ��
- `$("input:checked")`ѡȡ����ѡ�е�Ԫ��(radio,checkbox)
- `$("select:selectd")`
- `$(":input")`ѡȡ����`<input>/<textarea>/<select>/<button>`, ��$("input")ֻ���`<input>`
- `$(":text")`ѡȡ���е����ı���,�ȼ���`$("input:[type=text]")`
- `$(":password")`ѡȡ���������.ͬ������:radio, :checkbox, :submit, :image, :rest, :buttion, :file, :hidden

���ѡ����

$("li",$(this));//this�µ�liԪ��

�ڵ����

next()��ȡ��������һ����Ԫ��
nextAll()/nextAll("div")//��һ��Ϊ��ѡ�����ʵ�
siblings()/siblings("div") ���е��ֵ�

��ʽ���
```
$(this).css("background", "red").siblings("div").css("background", "green");
```
�ȼ������������:
```
$(this).css("background", "red");
$(this).siblings("div").css("background", "green");
```

attr

$(selector).attr(attribute)��������ֵ
$(selector).attr(attribute,value)��ֻ����ֵ
$("img").attr("width","180");
$(selector).attr(attribute,function(index,oldvalue))ͨ��������������ֵ
$("img").attr("width",function(index,oldvalue){return oldvalue -50;});
$("img").attr({width:"50",height:"80"});�������Զ�

removeAttr()ɾ������,֮��������ԾͲ�������,��ͬ�����

����Ԫ��

$(html���)����һ��dom�ڵ�,������һ��jquery����
```
var link = $("<a href='http://www.baidu.com'>baidu</a>")
$("div:first").append(link);

append(newChild)
appendTo(newFather)
```
prepend��Ԫ�صĿ�ʼ����Ԫ��(���Ӷ���)

after��Ԫ��֮������Ԫ��(�����ֵ�)

before��Ԫ��֮ǰ����Ԫ��(�����ֵ�)

`var link = $('<a href="http://wwww.baidu.com" id="link1">�ٶ�</a>');`//����֮��λ���ڴ���

$("#link1").text("����");//���ʱ���޸Ĳ��ɹ�,��Ϊlink��û�м��ص�ҳ����,�����Ҳ������id��Ԫ��

//link.text("��Ѷ");//��������޸�

`$(document.body).append(link);`

`$("#link1").text("����")`;//��������޸�

remove

remove�����ķ���ֵ�Ǳ�ɾ���Ķ���,�����Լ���ʹ��

�滻�ڵ�

replace

wrap����

$("b").wrap("<font color='red'></font>");

radio checkbox

radio��checkbox��ֵ��ʱ��Ҫͨ���������ʽ,��Ȼradioֻ��һ��ֵ,����Ҳ����������
```
<input type="radio" name="gender" value="homme" />��<br />
<input type="radio" name="gender" value="femme" />Ů<br />
<input type="radio" name="gender" value="secret" />δ֪<br />
$("#btnSet").click(function () {
	   $(":radio[name=gender]").val(["femme"]);
});

$("#btnGet").click(function () {
	   alert($(":radio[name=gender]:checked").val());
});
```

bind

bindע�ắ��,����һ���ü�д��ʽ
```
$("#btn").bind("click",function(){})
```

bind()�Ƴ�����ע���¼�

unbind("click")

hover(overfn,outfn)

������ȥ����overfn,�뿪����outfn

�¼�e

ð��/stopPropagation

��������¼�����Ϣ(����dom��window.event�������¼���Ϣ),ֻ���ڵ��õ���������ʱ��һ������,һ��������e

jquery��Ҳ���¼�ð��,���ǿ�����stopPropagation����ֹð��

preventDefault

e.preventDefault();//��ֹĬ����Ϊ�Ĵ���

target

target��ô����¼���Ԫ��(�����ð��,��Ϊð�ݵ���ʼԪ��)

pageX,pageY

pageX,pageY��Dom��clientX,clientY

����

which

���������¼�,��ð���(1:���,2:�м�,3:�Ҽ�)

altKey,shiftKey,ctrlKey

keyCode charCode

һ�����¼�

one()ִֻ��һ�ε��¼�

show,hide,toggle

�����в���,������ʾʱ��,�Ժ���Ϊ��λ

toggle(),��ǰΪshow,��hide;��ǰΪhide,��show

click()ģ����

��ֻдclick()ʱ,����д����ĺ���ʱ,���൱�ڽ�����һ��ģ�ⵥ��

cookie

cookie����������ص�,����163.com���ܶ�ȡbaidu.com��cookie

ͬһ����������һ��ҳ��Ҳ�ܶ�ȡ

һ��������д���cookie�ܳߴ��������Ƶ�,���д�������,��һ�β�һ���ܶ���

$.cookie('name', 'value', {expires: 7, path: '/', domain: 'jquery.com', secure: true});

���expires����ֵ,��������رպ�,cookie�ͻᱻɾ��
```
$(function () {
	if ($.cookie("username")) {
		$("#username").val($.cookie("username"));
	}
	$("#signIn").click(function () {
		 $.cookie("username", $("#username").val());
		 alert("your name is " + $("#username").val());
	 });
});
<input type="text" name="name" value=" " id="username"/>
<input type="button" name="name" value="signIn" id="signIn" />
```
 
jquery addclass ��class ��ָʲô?

```
$( "#create-user" ).button().click(function()
$( "#create-user" ):�����ײ�JQUERY���� 
.button():���ײ����ת����button�ӿ�
.click:button�ӿڵ��¼�
```