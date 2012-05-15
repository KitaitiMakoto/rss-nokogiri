require 'rss'
require 'nokogiri'

module RSS
  class NokogiriParser < BaseParser
    VERSION = '0.0.1'

    class << self
      def listener
        NokogiriListener
      end
    end

    private

    def _parse
      parser = ::Nokogiri::XML::SAX::Parser.new(@listener)
      parser.parse(@rss) do |ctx|
        ctx.replace_entities = true
      end
    end
  end

  class NokogiriListener < BaseListener
    include ListenerMixin

    def xmldecl version, encoding, standalone
      super(version, encoding, standalone == 'yes')
    end

    def start_document
    end

    def end_document
    end

    def start_element(name, attrs = [])
    end

    def end_element(name)
    end

    def start_element_namespace(name, attributes = [], prefix = nil, uri = nil, ns = [])
      name = prefix.nil? ? name : "#{prefix}:#{name}"
      attrs = {}
      attributes.each do |attr|
        key = (attr.prefix.nil? ? '' : "#{attr.prefix}:") + attr.localname
        attrs[key] = attr.value
      end
      ns.each do |ary|
        key = 'xmlns'
        key << ":#{ary[0]}" unless ary[0].nil?
        attrs[key] = ary[1]
      end

      tag_start name, attrs
    end

    def end_element_namespace(name, prefix = nil, uri = nil)
      name = prefix.nil? ? name : "#{prefix}:#{name}"

      tag_end name
    end

    def characters(string)
      text(string)
    end

    def comment(string)
    end

    def warning(string)
    end

    def error(string)
      raise NotWellFormedError.new(string) if string =~ /Entity '.*' not defined/
    end

    def cdata_block(string)
      text(string)
    end
  end

  AVAILABLE_PARSER_LIBRARIES << ['rss/nokogiri', :NokogiriParser]
  AVAILABLE_PARSERS << NokogiriParser
  Parser.default_parser = NokogiriParser
end
