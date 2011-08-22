module ClientHelper
  def tags_facelist_javascript(options = {})
    if !request.xhr? && !options[:in_head]
      content_for(:head) {tags_facelist_javascript(options.merge(:in_head => true))}
    else
      javascript_tag do
        "$(document).ready(function() {
          $('##{options[:prefix] ? options[:prefix] + '_' : ''}tags_text').faceList('/tags/autocomplete', {
            returnID: '#{options[:prefix] ? options[:prefix] + '_' : ''}tags',
            minChars: 2,
            intro_text: '#{options[:intro_text]}',
            no_result: '',
            formatList: function(data, formatted) {return formatted.html(data['name']);},
            queryParam: 'term',
            selectedItem: 'value',
            neverSubmit: true,
            start_value: #{options[:tag_list].collect {|t| {:value => t}}.to_json},
            resultClick: function(data) {$.fancybox.resize();$('#as-input-#{options[:prefix] ? options[:prefix] + '_' : ''}tags').focus()},
            resultsComplete: function(elem) {
              var height = $('.facelist-result-item').size() * $('.facelist-result-item').outerHeight();
              $('#fancybox-inner').height($('#fancybox-inner').height() + height);
              $('#as-input-tags').focus();
            }
          });
        });"
      end
    end
  end
end