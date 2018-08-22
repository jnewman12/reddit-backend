# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Post.create(
#   title: 'Test',
#   link: nil,
#   body: 'hello, world!'
# )

Comment.create([
  {
    post_id: 1,
    body: 'cool one guy'
  },
  {
    post_id: 1,
    body: 'haahhahahahahahhahahahahahahha'
  },
  {
    post_id: 1,
    body: 'Lorem ipsum dolor amet succulents banjo readymade, ramps synth cloud bread whatever plaid asymmetrical. Af yuccie beard, jianbing cardigan celiac scenester man braid seitan mlkshk. Shabby chic lomo crucifix cardigan direct trade disrupt. Echo park authentic williamsburg shabby chic, butcher palo santo paleo tilde 3 wolf moon. Tilde everyday carry actually brooklyn etsy deep v salvia unicorn. Umami wayfarers deep v distillery drinking vinegar.

      Oh. You need a little dummy text for your mockup? How quaint.

      I bet you’re still using Bootstrap too…'
  }
])