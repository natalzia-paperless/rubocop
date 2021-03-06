# encoding: utf-8
# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Style::MultilineMethodCallBraceLayout, :config do
  subject(:cop) { described_class.new(config) }
  let(:cop_config) { { 'EnforcedStyle' => 'symmetrical' } }

  it 'ignores implicit calls' do
    inspect_source(cop, ['foo 1,',
                         '2'])

    expect(cop.offenses).to be_empty
  end

  it 'ignores single-line calls' do
    inspect_source(cop, 'foo(1,2)')

    expect(cop.offenses).to be_empty
  end

  it 'ignores calls without arguments' do
    inspect_source(cop, 'puts')

    expect(cop.offenses).to be_empty
  end

  include_examples 'multiline literal brace layout' do
    let(:open) { 'foo(' }
    let(:close) { ')' }
  end
end
