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
					showErrorAlert();
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
					showErrorAlert();
				}
			});
			return false;
		});
		
	$(".multiEditingCheck").click(
			function() {
				if ($(this).is(':checked')) {
					$(this).closest(".root").find(".prefix").attr("disabled", false);
					$(this).closest(".root").find(".prefix")
							.on("keyup",prefixChangedHandler)
				} else {
					$(this).closest(".root").find(".prefix").attr("disabled", true);

				}

			});
	

	}
	function prefixChangedHandler(event) {		
		el=$(event.target)
		token = ".INQUIR";
		prefix = el.val();		
			el.closest(".root").find(".editableQueue").each(function() {
				oldValue = $(this).val()
				lastIndexToChange = oldValue.indexOf(token)				
				newValue = prefix + oldValue.slice(lastIndexToChange)				
				$(this).val(newValue)

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
	function showErrorAlert(msg) {
		if (!msg) {
			msg = "Operation Failed , sorry for inconvenience"
		}
		$('#modal_alert').find('#modal_body >p').text(msg);
		$('#modal_alert').modal({
			keyboard : true
		});

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
				showErrorAlert();
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