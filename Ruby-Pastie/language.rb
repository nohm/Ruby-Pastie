# Language choices

module Pastie
  def self.langs
    @LANGS = %w[objective_c action_script ruby rails diff plain c css java java_script html erb bash sql php python n_a perl yaml c_sharp]
  end
  
  def self.lang_alias
    @LANG_ALIAS = {"c#" => "c_sharp", "js" => "java_script"}
  end
  
  def self.lang_list
    @LANG_LIST = (lang_alias.keys + langs).join(',')
  end
  
  def self.langs_a
    @LANGS_A = langs.to_a
  end
  
  # Find index for given language
  def self.parser_id(language)
    index = langs_a.index(language)
    if index.nil?
      6
    else
      index + 1
    end
  end
end