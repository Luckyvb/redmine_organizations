module OrganizationsHelper

  def organization_type_options_for_select(selected = nil, disabled = nil)
    items = Organization.arrange_serializable(:order => :name)
    "<options>#{organization_ancestry_options(items, selected, disabled)}</options>".html_safe
  end

  def organization_ancestry_options(items, selected = nil, disabled = nil, level=0)
    options = ''
    items.each do |e|
      s = " selected=\"selected\"" if !selected.blank? && selected == e['id']
      d = " disabled=\"disabled\"" if !disabled.blank? && disabled.to_i == e['id']
      options << "<option value=\"#{e['id']}\"#{s}#{d} class=\"options-group-lvl-#{level}\">#{e['name']}</option>"
      options << organization_ancestry_options(e['children'], selected, disabled, level+1) if !e['children'].blank? && e['children'].any?
    end
    options
  end
end
