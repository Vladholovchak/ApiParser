require 'rspec'
require_relative '../api_parser'

describe ApiParser do
  let(:parser) { ApiParser.top_headlines('us', 'news') }
  let(:parser_new) { ApiParser.new('us', 'news') }

  describe 'us' do
    specify { expect(parser).to exist }
  end

  it 'can change country shortcut' do
    expect { parser.country = 'ua' }.to change { parser.country }.from('us').to('ua')
  end

  context 'top_headlines' do
    it 'parse news and save it in variable' do
      expect(parser.parsed_news).not_to be_empty
    end
  end

  context 'self top_headlines' do
    it 'creates different instance of class' do
      expect(parser).not_to eq(parser_new)
    end
    it 'creates instance of class ApyParser' do
      expect(parser).to be_an_instance_of(ApiParser)
    end
  end

  context 'pretty_show' do
    it 'can show news in console' do
    end
  end

  context 'save_to_file' do
    it 'save news in file' do
      parser.save_to_file
      expect(File.exist? 'news.json').to eq(true )
    end
  end
end
