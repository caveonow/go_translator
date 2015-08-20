require 'spec_helper'

describe GoTranslator do
  it 'has a version number' do
    expect(GoTranslator::VERSION).not_to be nil
  end

  describe '.translate' do
    context 'valid response from server' do
      it 'translates successfully' do
        expect(Net::HTTP).to receive(:get).and_return("[[[\"\xE4\xBD\xA0\xE5\xA5\xBD\xE4\xB8\x96\xE7\x95\x8C\",\"hello world\",,,0],[,,\"N\xC7\x90 h\xC7\x8Eo sh\xC3\xACji\xC3\xA8\"]],,\"en\"]")
        expect(GoTranslator.translate('Hello world')).to eq "你好世界"
      end
    end

    context 'no response from server' do
      it 'returns empty string' do
        expect(Net::HTTP).to receive(:get).and_return('')
        expect(GoTranslator.translate('random')).to eq ''
      end
    end

    context 'there is an exception from server' do
      it 'returns empty string' do
        expect(Net::HTTP).to receive(:get).and_raise
        expect(GoTranslator.translate('random')).to eq ''
      end
    end
  end

  describe '.default_options' do
    let(:expected_result) do
      {
        from: GoTranslator::DEFAULT_FROM,
        to: GoTranslator::DEFAULT_TO,
        in_encoding: GoTranslator::DEFAULT_IN_ENCODING,
        out_encoding: GoTranslator::DEFAULT_OUT_ENCODING
      }
    end

    it 'has valid default_options' do
      expect(GoTranslator.default_options).to eq expected_result
    end
  end
end
