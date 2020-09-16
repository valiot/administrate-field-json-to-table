# frozen_string_literal: true

require 'administrate/field/jsontable'
require File.expand_path('../../../support/read_fixture', __dir__)
require 'rails_helper'

describe 'fields/jsontable/_index', type: :view do
  include ReadFixture

  let(:pure_hash) do
    instance_double(
      'Administrate::Field::Jsontable',
      data: {
        "2019": {
          "start_date": '2019-01-01',
          "end_date": '2019-12-31',
          "id": '123456_2019'
        },
        "2020": {
          "start_date": '2020-01-01',
          "end_date": '2020-12-31',
          "id": '123456_2020'
        }
      }
    )
  end

  let(:pure_array) do
    instance_double(
      'Administrate::Field::Jsontable',
      data: [1, 2, 3, 4]
    )
  end

  let(:hash_contains_array) do
    instance_double(
      'Administrate::Field::Jsontable',
      data: {
        "2019": {
          "ids": [1, 2, 3, 4],
          "end_date": '2019-12-31',
          "id": '123456_2019'
        }
      }
    )
  end

  let(:array_contains_hash) do
    instance_double(
      'Administrate::Field::Jsontable',
      data: [1, 2, 3, { "2019": {
        "start_date": '2019-01-01',
        "end_date": '2019-12-31',
        "id": '123456_2019'
      } }]
    )
  end

  it 'displays pure_hash' do
    allow(view).to receive(:valid_action?).and_return(true)
    render_jsontable_index(field: pure_hash)

    expect(rendered.strip).to eq(read_fixture('pure_hash.html'))
  end

  it 'displays pure_array' do
    allow(view).to receive(:valid_action?).and_return(true)
    render_jsontable_index(field: pure_array)

    expect(rendered.strip).to eq('[1, 2, 3, 4]')
  end

  it 'displays hash_contains_array' do
    allow(view).to receive(:valid_action?).and_return(true)
    render_jsontable_index(field: hash_contains_array)

    expect(rendered.strip).to eq(read_fixture('hash_contains_array.html'))
  end

  it 'displays array_contains_hash' do
    allow(view).to receive(:valid_action?).and_return(true)
    render_jsontable_index(field: array_contains_hash)

    expect(rendered.strip).to eq(read_fixture('array_contains_hash.html'))
  end

  private

  def render_jsontable_index(field:)
    render(
      partial: 'fields/jsontable/index.html.erb',
      locals: { field: field, namespace: 'admin' }
    )
  end
end
