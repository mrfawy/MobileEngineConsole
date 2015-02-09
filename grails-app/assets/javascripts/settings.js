$(document).ready(function() {
	isAjaxActive = false;

	function refresh() {
		$("#accordion").accordion({
			collapsible : true,
			heightStyle : "content"
		});
		$(".refreshSettings").click(function() {
			el = $(this)
			preAjax(el);

			$.ajax({
				type : 'GET',
				url : '/member-engine-admin/settings/refresh',
				success : function(data) {
					$('#settingsPanelPlaceHolder').html(data);
					postAjax(el);
				},
				error : function(request, status, error) {
					postAjax(el);
					alert(request.responseText);
				}
			});
			return false;
		});
		$(".applySettings").click(function() {
			el = $(this)
			preAjax(el)
			$.ajax({
				type : 'POST',
				data : el.parents('form:first').serialize(),
				url : '/member-engine-admin/settings/applySettings',
				success : function(data) {
					$('#settingsPanelPlaceHolder').html(data);
					postAjax(el);
				},
				error : function(request, status, error) {
					postAjax(el);
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
	function preAjax() {
		isAjaxActive = true;
		el.unbind('click');
		el.attr("disabled", true);
		showOverlay();
	}
	function postAjax() {
		isAjaxActive = false;
		el.attr("disabled", false);
		hideOverlay();
		refresh();
	}
	$(".changeEnvLink").click(function() {
		el = $(this)
		preAjax(el)
		$.ajax({
			type : 'POST',
			data : {
				'env' : $(this).attr("env")
			},
			url : '/member-engine-admin/settings/getSettings',
			success : function(data) {
				$('#settingsPanelPlaceHolder').html(data);
				//unselected other active tabs
				el.parent().siblings().removeClass("active")
				//mark current tab as active
				el.parent().addClass("active")
				postAjax(el);
			},
			error : function(request, status, error) {
				postAjax(el);
				alert(request.responseText);
			}
		});
		return false;
	});

	$("#home").click(function() {
		$('#modal_alert').find('#modal_body >p').text("Welcome To Console!! ");
		$('#modal_alert').modal({
			keyboard: true
		});
		toggleOverlay();
	});
	refresh();

});