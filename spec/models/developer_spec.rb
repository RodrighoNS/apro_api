# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Developer, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }
end
