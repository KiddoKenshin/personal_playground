require "spec_helper"

RSpec.describe Arabic2english do
  it "has a version number" do
    expect(Arabic2english::VERSION).not_to be nil
  end

  it "does return correct words" do
    expect(Arabic2english.integer2word 1).to eq 'one'
    expect(Arabic2english.integer2word 11).to eq 'eleven'
    expect(Arabic2english.integer2word 100).to eq 'one hundred'
  end
end
