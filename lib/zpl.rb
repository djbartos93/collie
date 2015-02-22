module Zpl
  def generate_asset_tag(tag_num)
    File.read(File.expand_path(CONFIG[:LABEL_PRINTING][:DEFAULT_ZPL])).gsub(/#TAG_NUM/, tag_num)
  end

  module_function :generate_asset_tag
end
