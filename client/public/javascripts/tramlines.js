var Products = {
  init: function(){
    var department = document.location.hash.replace('#','');
    department = (department == '' ? 'dep_all' : 'dep_' + department);
    Products.showDepartment(department);
    $('.department').click(function(){
      Products.showDepartment($(this).attr('id'));
    });
  },
  showDepartment: function(department){
    $('.department').removeClass('active');
    $('#'+department).addClass('active');
    if ((department == null || department == '' || department =='dep_all')){
      document.location.hash = 'all';
      $('.product').show();
    } else if (matches = department.match(/^dep_(.*)$/)){
      document.location.hash = matches[1];
      $('.product').hide();
      $('.product.'+department).show();
    }
  }
};

var DepartmentForm = {
  complete: function(unique_id) {
    $('#' + unique_id + '_department_ajax_loader').hide();
    $('#' + unique_id + '_department_edit_link').show();
  },
  hide_form: function (unique_id) {
    $('#' + unique_id + '_department_form').hide(0, function() {
      $('#' + unique_id + '_department_display').show();
      $('#' + unique_id + '_department_edit_link').html('edit');
      $('#' + unique_id + '_department_delete_link').show();
      $('#' + unique_id + '_department_save_link').hide();
    });
  },
  hide_new_form: function() {
    $('#new_department_form').hide(0,function() {
      $('#new_department_link').show();
    });
  },
  loading: function(unique_id) {
    $('#' + unique_id + '_department_form').hide(0, function() {
      $('#' + unique_id + '_department_display').hide();
      $('#' + unique_id + '_department_ajax_loader').show();
      $('#' + unique_id + '_department_edit_link').hide();
      $('#' + unique_id + '_department_delete_link').hide();
      $('#' + unique_id + '_department_save_link').hide();
    });
  },
  show_form: function(unique_id) {
    $('#' + unique_id + '_department_form').show(0, function() {
      $('#' + unique_id + '_department_display').hide();
      $('#' + unique_id + '_department_edit_link').html('cancel');
      $('#' + unique_id + '_department_delete_link').hide();
      $('#' + unique_id + '_department_save_link').show();
      $('#' + unique_id + '_department_form .department_name_input').focus();
    });
  },
  show_new_form: function() {
    $('#new_department_form').show(0,function() {
      $('#new_department_link').hide();
      $('#new_department_form .department_name_input').focus();
    });
  },
  toggle_form: function(unique_id) {
    $('#' + unique_id + '_department_ajax_loader').hide(0, function() {
      if ($('#' + unique_id + '_department_form').is(':visible')) {
        DepartmentForm.hide_form(unique_id);
      } else {
        DepartmentForm.show_form(unique_id);
      }
    });
  },
  toggle_new_form: function() {
    if ($('#new_department_form').is(':visible')) {
      DepartmentForm.hide_new_form();
    } else {
      DepartmentForm.show_new_form();
    }
  }
};
