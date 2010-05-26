$(function() {
	var post_editor_elm = $('.post_editor');
	var checkbox_elm = post_editor_elm.find('input[type=checkbox]');
	var select_elms = post_editor_elm.find('select');
	
	checkbox_elm.change(update);
	
	update();
	
	function update() {
		select_elms.attr('disabled', !checkbox_elm.attr('checked'));
	}
});
