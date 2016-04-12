class DmsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_vendorstrator
    OSD_SCHEMA.each do |table, attributes|
      attr_list = attributes['fields'].map{|x,y|"#{x}:#{y}"}.join(" ")
      generate "scaffold #{table} #{attr_list}"
    end
  end
end
