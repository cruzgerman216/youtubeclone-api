# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts Faker::Name.first_name
# puts Faker::Name.last_name 
# puts Faker::Internet.email 
# puts Faker::Internet.password
# num = Random.new.rand(0...99)
# num_sentences = Random.new.rand(0...10)
# num_paragraphs = Random.new.rand(0...10)

# puts Faker::Lorem.sentence(word_count:num_sentences)
# puts Faker::Lorem.paragraphs(number:num_paragraphs).join(" ")
# puts "https://i.stack.imgur.com/l60Hf.png"
# puts "https://i.ytimg.com/vi/oDf8h5PNKnI/maxresdefault.jpg"

# static data image urls

thumbnails = [
    "https://i.ytimg.com/vi/WLA7l2n9cVE/maxresdefault.jpg",
    "https://dwgyu36up6iuz.cloudfront.net/heru80fdn/image/upload/c_fill,d_placeholder_wired.png,fl_progressive,g_face,h_450,q_80,w_800/v1576859342/wired_top-videogames-in-the-last-50-years.jpg",
    "https://cdn.cnn.com/cnnnext/dam/assets/190605122713-youtube-bans-deniers-large-169.jpg",
    "https://miro.medium.com/max/4252/1*9qS3yM0_HipiqZ4nS0LIaQ.png",
    "https://images.ctfassets.net/00i767ygo3tc/asset-sktwi7jfjxrnhfrt/41c8285f1baabc07197afff61bf98efe/Video-maker-for-creating-videos-from-photos-and-video-clips-37c69f551f.jpg",
    "https://illuminaija.com/wp-content/uploads/2020/01/VIDEO-Russ-NIGHTTIME-Interlude.jpg",
    "https://i.pinimg.com/564x/f1/4c/13/f14c13125d42162231389f8da5820c43.jpg",
    "https://cloudfront.jove.com/CDNSource/homepage/bg_video_poster.jpg",
    "https://cdn.cnn.com/cnnnext/dam/assets/200518112524-02-pac-man-40-large-tease.jpg",
    "https://www.drmare.com/images/resource/record-music-from-youtube.jpg"
]

profile_images = [
    "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
    "https://i.redd.it/v0caqchbtn741.jpg",
    "https://static.jobscan.co/blog/uploads/linkedin-profile-picture-1280x720.jpg",
    "https://free-profile-pics.com/images/heres-johnny-profile-picture.png",
    "https://www.goodmorningimagesdownload.com/wp-content/uploads/2020/05/Profile-Picture-5.jpg",
    "https://cdn.vox-cdn.com/thumbor/ciRuSgJ8XzCsz8n0U46dfvFcTsA=/0x0:2040x1360/1200x800/filters:focal(857x517:1183x843)/cdn.vox-cdn.com/uploads/chorus_image/image/65444878/acastro_181114_1777_amazon_hq2_0005.0.jpg",
    "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
    "https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_960_720.png",
    "https://widgetwhats.com/app/uploads/2019/11/free-profile-photo-whatsapp-4.png",
    "https://www.zenrooms.com/blog/wp-content/uploads/2020/05/funny-cats-2.jpg",
]

urls = [
    "https://www.youtube.com/embed/s0B8lmETZ8w?autoplay=1&mute=1",
    "https://www.youtube.com/embed/MbXWrmQW-OE?autoplay=1&mute=1",
    "https://www.youtube.com/embed/FBcI_2PFLMU?autoplay=1&mute=1",
    "https://www.youtube.com/embed/WNeLUngb-Xg?autoplay=1&mute=1",
    "https://www.youtube.com/embed/JgSLf-HS5gg?autoplay=1&mute=1",
]

banners = [
    "https://www.wallpapertip.com/wmimgs/91-919893_free-youtube-banner-templates-banner-youtube.jpg",
    "https://i.ytimg.com/vi/oDf8h5PNKnI/maxresdefault.jpg",
    "https://helmpaint.com/wp-content/uploads/2020/01/3-D-wallpaper.jpg",
    "https://i.pinimg.com/originals/a4/f8/f9/a4f8f91b31d2c63a015ed34ae8c13bbd.jpg",
    "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569__340.jpg",
    "https://store.hp.com/app/assets/images/uploads/prod/25-best-hd-wallpapers-laptops159561982840438.jpg",
    "https://sf-applications.s3.amazonaws.com/Bear/wallpapers/11/jan-2021-wallpaper_desktop-3840x1600.png"
]

rand_banner = Random.new.rand(0...7)
primary_user = User.create(
    username: "cruzgerman216",
    firstname: "German",
    lastname: "Cruz",
    email: "gcthecoder@gmail.com",
    password: "password",
    description: "Like, Comment and Subscribe",
    image: profile_images[1],
    banner: banners[rand_banner]
)

# Seeding Users
x = 0
while x < 50
    num_paragraphs = Random.new.rand(0...10)
    random = Random.new.rand(0...9)
    rand_banner = Random.new.rand(0...7)

    u = User.create(
        username: Faker::Internet.username,
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name ,
        email: Faker::Internet.email,
        password: "password",
        description: Faker::Lorem.paragraphs(number:num_paragraphs).join(" "),
        image: profile_images[random],
        banner: banners[rand_banner]
    )
    x+=1
end

# Seeding Subscriptions
x = 0
users = User.all 
while x < 50
    subs_number = Random.new.rand(0...49)
    subscription_number = Random.new.rand(0...49)
    y = 0
    while y < subs_number 
        ran = Random.new.rand(0...49)
        find_user = users[x].subs.find_by(id:users[ran].id)
        if find_user 
            puts "duplicate sub"
        else
            users[x].subs << users[ran]
        end
        y+=1
    end
    z = 0
    while z < subscription_number 
        ran = Random.new.rand(0...49)
        find_user = users[x].subscriptions.find_by(id:users[ran].id)
        if find_user 
            puts "duplicate sub"
        else
            users[x].subscriptions << users[ran]
        end
        z+=1
    end
    x+=1
end

x = 0
users = User.all 
while x < 300
    num = Random.new.rand(0...49)
    random = Random.new.rand(0...9)
    num_sentences = Random.new.rand(0...10)
    num_paragraphs = Random.new.rand(0...10)
    word_count = Random.new.rand(0...10)
    rand_url = Random.new.rand(0...4)

    video = Video.new(
        views: 0,
        title: Faker::Lorem.sentence(word_count:word_count),
        description: Faker::Lorem.paragraphs(number:num_paragraphs).join(" "),
        thumbnail: thumbnails[random],
        url: urls[rand_url]
    )
    users[num].videos << video
    x+=1
end

x = 0
videos = Video.all
users = User.all
while x < 500
    num = Random.new.rand(0...49)
    num2 = Random.new.rand(0...99)
    num_sentences = Random.new.rand(0...10)
    Comment.create(
        statement: Faker::Lorem.sentence(word_count:num_sentences),
        user_id: users[num].id,
        video_id: videos[num2].id
    )
    x+=1
end
