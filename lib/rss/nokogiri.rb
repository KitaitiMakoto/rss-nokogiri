require 'rss'

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
      name = [prefix, name].compact.join(':')
      attrs = {}
      attributes.each do |attr|
        key = [attr.prefix, attr.localname].compact.join(':')
        attrs[key] = attr.value
      end
      ns.each do |(prefix, uri)|
        key = ['xmlns', prefix].compact.join(':')
        attrs[key] = uri
      end

      tag_start name, attrs
    end

    def end_element_namespace(name, prefix = nil, uri = nil)
      name = [prefix, name].compact.join(':')

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

  begin
    lib = 'nokogiri'
    require lib

    AVAILABLE_PARSER_LIBRARIES << ['rss/nokogiri', :NokogiriParser]
    AVAILABLE_PARSERS << NokogiriParser
    Parser.default_parser = NokogiriParser
  rescue LoadError
    warn "Couldn't load #{lib}. Falled back to the default parser(#{Parser.default_parser})."
  end
end
