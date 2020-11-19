class Resident < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '入居者あり' },
    { id: 3, name: '入居者なし' }
  ]

  include ActiveHash::Associations
  has_many :homes
end
