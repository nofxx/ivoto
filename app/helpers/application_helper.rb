# -*- coding: utf-8 -*-
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def cu?
    !!current_user
  end

  def admin?
    current_user.kind == :admin
  end

  def display_flashes
    flashes = ''
    unless flash.size == 0
      flash.each_pair  do |key, value|
        flashes += content_tag(:div, content_tag(:div, value, :class => 'message '+key.to_s), :class => 'flash')
      end
    end
    flashes
  end

  def sidebar(&block)
    content_for :sidebar do
      concat "<div class='block'><h3>Menu</h3><ul class='navigation'>"
      yield
      concat '</ul></div>'
    end
  end

  def yn(bool)
    bool ? "Sim" : "Não"
  end

  def link_or_nil(obj, *args)
    opts = { :link_text => obj, :url => obj, :text => '-' }.update( args.extract_options! )
    if obj
      link_to((opts[:link_text_method] ? obj.send(opts[:link_text_method]) : opts[:link_text]), opts[:url])
    else
      opts[:text]
    end
  end

  def back_link(txt = "Voltar")
    link_to txt, { :controller => controller.controller_name, :action => :index } , :class => 'icon back'
  end

  def edit_link(id=nil, txt = "Editar")
    if id
      id = id.id unless id.is_a? Integer
      link_to txt, { :controller => controller.controller_name, :action => :edit, :id => id }, :class => 'icon edit'
    else
      link_to txt, { :controller => controller.controller_name, :action => :edit }, :class => 'icon edit'
    end
  end

  def destroy_link(id = nil, txt = "Excluir")
    if id
      id = id.id unless id.is_a? Integer
      link_to txt, { :controller => controller.controller_name, :action => :destroy, :id => id }, :class => 'icon destroy', :method => :delete
    else
      link_to txt, { :controller => controller.controller_name, :action => :destroy }, :class => 'icon destroy', :method => :delete
    end
  end

  def save_or_cancel(f)
    out = "<div class='clear'></div><div class='navform'>"
    out += f.submit "Gravar"
    out += "ou"
    link = url_for(:controller => controller.controller_name, :action => :index) rescue "/"
    out += link_to "cancelar", link
    out += "</div>"
  end


  def count_as_text(num, one, more, zero = nil)

    out = case num
    when 0; zero || one;
    when 1; one;
    else more;
    end
    out % num
  end
end
