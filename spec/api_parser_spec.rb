require 'rspec'
require_relative '../api_parser'

describe ApiParser do
  let(:parser) { ApiParser.top_headlines('us', 'news') }
  let(:parser_new) { ApiParser.new('us', 'news') }

  it 'has query with country and API KEY' do
  end

  it 'creates different instance of class' do
    expect(parser).not_to eq(parser_new)
  end

  it 'creates instance of class ApyParser' do
    expect(parser).to be_an_instance_of(ApiParser)
  end

  it 'parse news and save it in variable' do
    expect(parser.parsed_news).not_to be_empty
  end

  it 'can change country' do
    expect { parser.country = 'ua' }.to change { parser.country }.from('us').to('ua')
  end

  it 'can show news in console' do
  end

  it 'save news in file' do
  end
end
