require 'administrate/field/json-to-table'

describe Administrate::Field::JsonToTable do
  describe '#to_partial_path' do
    it 'returns a partial based on the page being rendered' do
      page = :show
      field = Administrate::Field::JsonToTable.new(:status, 'status', page)

      path = field.to_partial_path

      expect(path).to eq("/fields/json-to-table/#{page}")
    end
  end
end
