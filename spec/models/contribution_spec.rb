require 'rails_helper'

describe Contribution do
  it { should validate_presence_of :content }
  it { should validate_presence_of :image }
  it { should belong_to :user }
  it { should belong_to :story }
end
