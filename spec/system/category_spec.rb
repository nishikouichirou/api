require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  let!(:category) { create(:category) }
  let!(:idea) { create(:idea, category: category) }

  before do
    visit categories_path
  end

  it 'カテゴリーページを表示する' do
    expect(page).to have_content 'カテゴリー一覧ページ'
  end

  it'既存のカテゴリー名が表示される' do
    expect(page).to have_content 'サンプルカテゴリー'
  end

  it '新しいカテゴリーを作成' do
    fill_in 'カテゴリー名入力してください', with: 'ズボン'
    click_on '作成'
    expect(page).to have_content 'ズボン'
  end

  it'アイデアページにリダイレクトする' do
    click_on 'サンプルカテゴリー'
    expect(page).to have_content 'アイデア一覧ページ'
  end

  it'既存のアイデアデータが表示される' do
    click_on 'サンプルカテゴリー'
    expect(page).to have_content 'サンプルアイデア'
  end

  it'新しいアイデアを作成する' do
    click_on 'サンプルカテゴリー'
    fill_in 'アイデア名入力してください', with: '茶色のサンプル'
    click_on '作成'
    expect(page).to have_content '茶色のサンプル'
  end
end
