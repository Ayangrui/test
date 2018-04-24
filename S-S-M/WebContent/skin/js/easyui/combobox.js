$(function(){
	$("#et").combobox({
		url:contextPath+'/combobox/getGender.do',
		textField:'label',
		valueField:'value',
		/*data:[{
			label: 'k-java',
			value: 'v-Java'
		},{
			label: 'k-et-perl',
			value: 'v-Perl'
		},{
			label: 'k-et-ruby',
			value: 'v-Ruby'
		}],*/
		panelHeight:80,
		
		onSelect:function(r){
			console.log(r.label+" | "+r.value);
		}
	});
});