$(document).ready(function() {
	isAjaxActive=false;

	function refresh() {
		$("#accordion").accordion({
			collapsible : true,
			heightStyle : "content"
		});
		$(".refreshSettings").click(function() {
			preAjax();
			
			$.ajax({
				type : 'GET',
				url : '/member-engine-admin/settings/refresh',
				success : function(data) {					
					$('#settingsPanelPlaceHolder').html(data);
					postAjax();
				},
				error : function(request, status, error) {
					 alert(request.responseText);
				}
			});
			return false;
		});
		$(".applySettings").click(function() {
			preAjax()
			el=$(this)
			$.ajax({
				type : 'POST',
				data : el.parents('form:first').serialize()
				,
				url : '/member-engine-admin/settings/applySettings',
				success : function(data) {				
					$('#settingsPanelPlaceHolder').html(data);					
					postAjax();
				},
				error : function(request, status, error) {
					 alert(request.responseText);
				}
			});
			return false;
		});

	}
	var overlayTarget = '#settingsPanel'
	function showOverlay() {
		$(overlayTarget).loadingOverlay();
	}
	function hideOverlay() {
		$(overlayTarget).loadingOverlay('remove');
	}
	function toggleOverlay() {
		if ($(overlayTarget).hasClass("loading")) {
			hideOverlay()
		} else {
			showOverlay()
		}

	}
	function preAjax(){
		isAjaxActive=true;
		showOverlay();
	}
	function postAjax(){
		isAjaxActive=false;
		hideOverlay();
		refresh();
	}
	$(".changeEnvLink").click(function() {
		preAjax()
		el=$(this)
		$.ajax({
			type : 'POST',
			data : {
				'env' : $(this).attr("env")
			},
			url : '/member-engine-admin/settings/getSettings',
			success : function(data) {				
				$('#settingsPanelPlaceHolder').html(data);
				el.addClass("active")
				postAjax();
			},
			error : function(request, status, error) {
				 alert(request.responseText);
			}
		});
		return false;
	});
	
	
	
	
	$("#home").click(function() {
		toggleOverlay();
	});
	refresh();
	

});