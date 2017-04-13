require 'spec_helper'

describe 'validate_kibana_config' do

 #context 'with valid parameters' do
    {
      'server.host' => 'localhost',
      'server.port' => 5601,
      'elasticsearch.ssl.verify' => true,
      'elasticsearch.requestHeadersWhitelist' => [ 'authorization' ]
    }.each do |key, val|
      context "'#{val}'" do
        it { should run.with_params({ key => val }).and_return({ key => val }) }
      end
    end
  #end

  #context 'with bad parameters' do
    {
      'server.host' => { 'foo' => 'bar' },
      'server.basePath' => '',
      5601 => nil,
      '' => nil
    }.each do |key, val|
      context "'#{val}'" do
        it { should run.with_params({ key => val }).and_raise_error(Puppet::ParseError) }
      end
    end
  #end

  #context 'too many parameters' do
    it { should run.with_params({ 'server.host' => 'localhost' }, { 'server.host' => 'localhost' }).and_raise_error(Puppet::ParseError) }
  #end

  #context 'not a hash' do
    it { should run.with_params('not a hash').and_raise_error(Puppet::ParseError) }
  #end
end
