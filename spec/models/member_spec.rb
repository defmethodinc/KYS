require 'rails_helper'

describe Member, type: :model do
  let(:member) {
    FactoryBot.create(:staff)
  }
  let(:tool) {
    FactoryBot.create(:tool)
  }

  let(:skill) {
     FactoryBot.create(:skill, member.id, tool.id)
   }

  it 'staff has first name' do
    # FactoryBot.create(:experience, skill )
    expect(member.name).to eq("John")
  end

  it 'tool has name' do
    # FactoryBot.create(:experience, skill )
    expect(tool.name).to eq("java")
  end


  it 'Member has skills' do
    expect(skill.tool).to eq("java")
  end
end
