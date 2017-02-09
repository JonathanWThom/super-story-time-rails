require 'rails_helper'

describe Story do
  it { should validate_presence_of :title }
  it { should have_many(:users).through(:contributions) }
end
