# Encoding: utf-8
# Cloud Foundry Java Buildpack
# Copyright (c) 2013 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'
require 'application_helper'
require 'java_buildpack/util/ratpack_utils'

describe JavaBuildpack::Util::RatpackUtils do
  include_context 'application_helper'

  let(:utils) { described_class.new }

  it 'should detect a dist Ratpack application',
     app_fixture: 'container_ratpack_dist' do

    expect(utils.is?(application)).to be
  end

  it 'should detect a staged Ratpack application',
     app_fixture: 'container_ratpack_staged' do

    expect(utils.is?(application)).to be
  end

  it 'should not detect a non-Ratpack application',
     app_fixture: 'container_main' do

    expect(utils.is?(application)).not_to be
  end

  it 'should determine the version a dist Ratpack application',
     app_fixture: 'container_ratpack_dist' do

    expect(utils.version(application)).to match(/0.9.0/)
  end

  it 'should determine the version a staged Ratpack application',
     app_fixture: 'container_ratpack_staged' do

    expect(utils.version(application)).to match(/0.9.0/)
  end

end
