-- These values will be used in the benchmarking
-- Note: these values were generated, as they look artificial
INSERT INTO users (id, name, age, email, is_male, address, bio) VALUES
(0, 'Alex Mercer', 20, 'alex.mercer@example.com', true, '742 Evergreen Terrace, Springfield', 'Enthusiastic software engineer who enjoys competitive coding, bouldering, and sci-fi novels'),
(1, 'Elena Rostova', 30, 'elena.r@example.com', false, '221B Baker Street, London', 'Data scientist and amateur astronomer. Loves hiking in the mountains and playing the cello'),
(2, 'Marcus Vance', 25, 'marcus.vance@example.com', true, '42 Wallaby Way, Sydney', 'UX designer passionate about digital accessibility, specialty coffee roasting, and urban photography'),
(3, 'Priya Sharma', 28, 'priya.sharma@example.com', false, '10 Downing Street, London', 'Cybersecurity analyst who enjoys strategy board games, sourdough baking, and trail running'),
(4, 'Kenji Takahashi', 34, 'kenji.t@example.com', true, '1-1 Chiyoda, Tokyo', 'Robotics engineer obsessed with retro arcade games, vinyl records, and Japanese street food'),
(5, 'Chloe Dubois', 22, 'chloe.d@example.com', false, '15 Rue de Rivoli, Paris', 'Graphic illustrator passionate about 2D animation, vintage fashion, and learning foreign languages'),
(6, 'Devon Miller', 27, 'devon.m@example.com', true, '100 Tech Hive Way, Austin', 'Product manager who spends weekends woodworking, running marathons, and experimenting with specialty teas'),
(7, 'Aaliyah Khan', 31, 'aaliyah.k@example.com', false, '500 Boylston St, Boston', 'Bioinformatics researcher passionate about ocean conservation, ceramic pottery, and indie podcasts'),
(8, 'Liam O''Connor', 24, 'liam.oc@example.com', true, '14 Grafton Street, Dublin', 'Full-stack developer into indie game development, acoustic guitar, and bouldering'),
(9, 'Sofia Gomez', 29, 'sofia.g@example.com', false, 'Paseo de la Reforma 222, Mexico City', 'Environmental lawyer who loves salsa dancing, urban gardening, and documentary filmmaking');

ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    age = EXCLUDED.age,
    email = EXCLUDED.email,
    is_male = EXCLUDED.is_male,
    address = EXCLUDED.address,
    bio = EXCLUDED.bio;
