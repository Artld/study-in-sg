users = [
  {first_name: 'Arthur', last_name: 'Rimbaud', username: 'LEnfant_de_Colere', password: 'i+found-0rthanz!', email: 'king@lchemic.fr', birthday: '20.10.1854'},
  {first_name: 'Vladimir', last_name: 'Mayakovsky', username: 'Comrade_Konstantin', password: 'iworked2fast,2hard', email: 'may@gray.ru', birthday: '19.07.1893'},
  {first_name: 'Sergey', last_name: 'Kalugin', username: 'YoungMaster', password: 'all+in)white^now', email: 'orgia@pravednikov.ru', birthday: '09.04.1967'}
]

users.each do |u|
  User.create u
end

posts = [
  {title: 'Ophelia', body: 'O pale Ophelia! beautiful as snow!', published_at: Time.zone.parse('1869-01-01 00:00')},
  {title: 'Ophelia', body: 'Yes child, you died, carried off by a river!', published_at: Time.zone.parse('1869-01-01 00:00')},
  {title: 'Ophelia', body: '- It was the winds descending from the great mountains of Norway', published_at: Time.zone.parse('1869-01-01 00:00')},
  {title: 'Ophelia', body: 'That spoke to you in low voices of better freedom.', published_at: Time.zone.parse('1869-01-01 00:00')},
  {title: 'From "I"', body: 'On pavement stones of my trampled soul', published_at: Time.zone.parse('1913-01-01 00:00')},
  {title: 'From "I"', body: 'Steps of madmen plait soles of harsh words.', published_at: Time.zone.parse('1913-01-01 00:00')},
  {title: 'From "I"', body: 'Where the cities are hung and in a cloud noose stilled', published_at: Time.zone.parse('1913-01-01 00:00')},
  {title: 'From "I"', body: 'Crooked turrets of towers', published_at: Time.zone.parse('1913-01-01 00:00')},
  {title: 'From "I"', body: 'I walk alone sobbing that on the crossroads are crucified the tsars cops.', published_at: Time.zone.parse('1913-01-01 00:00')},
  {title: 'Flores de muertos', body: '...las muchas aguas no podrán apagar el amor ni lo ahogarán los ríos!', published_at: Time.zone.parse('2016-01-01 00:00')},
  {title: 'Flores de muertos', body: 'Fuerte es como la muerte el amor', published_at: Time.zone.parse('2016-01-01 00:00')}
]

User.find(1).posts.create(posts[0])
User.find(1).posts.create(posts[1])
User.find(1).posts.create(posts[2])
User.find(1).posts.create(posts[3])
User.find(2).posts.create(posts[4])
User.find(2).posts.create(posts[5])
User.find(2).posts.create(posts[6])
User.find(2).posts.create(posts[7])
User.find(2).posts.create(posts[8])
User.find(3).posts.create(posts[9])
User.find(3).posts.create(posts[10])

images = [
  {url: 'https://commons.wikimedia.org/wiki/File:Carjat_Arthur_Rimbaud_1872_n2.jpg'},
  {url: 'http://www.albany.edu/offcourse/issue41/mayakovsky.jpg'},
  {url: 'https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/12784031_591777810971247_916518841_n.jpg'},
  {url: 'http://www.mag4.net/Rimbaud/poesies/nav/cabanel-ophelia.jpg'},
  {url: 'http://orgia.ru/upload/1454918670_op-dtkvs2-digipak_450.jpg'}
]

images.each do |i|
  Image.create i
end

Image.find(1).update_attribute(:imageable, User.find(1))
Image.find(2).update_attribute(:imageable, User.find(2))
Image.find(3).update_attribute(:imageable, User.find(3))
Image.find(4).update_attribute(:imageable, Post.find(1))
Image.find(5).update_attribute(:imageable, Post.find(10))
