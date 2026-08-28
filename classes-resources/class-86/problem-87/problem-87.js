// Author: Cristian Camilo Cortes Ortiz

class StreamingContent {

    constructor(title, genre, duration) {
        this.title = title;
        this.genre = genre;
        this.duration = duration;
    }

    showInformation() {
        return {
            title: this.title,
            genre: this.genre,
            duration: this.duration
        };
    }

    play() {
        return "Playing content....";
    }
}

class Movie extends StreamingContent {

    constructor(title, genre, duration, director) {
        super(title, genre, duration);
        this.director = director;
    }

    showInformation() {
        return {
            title: this.title,
            genre: this.genre,
            duration: this.duration,
            director: this.director
        };
    }

    play() {
        return "Playing movie in cinematic mode.";
    }
}

class Serie extends StreamingContent {

    constructor(title, genre, duration, numberOfEpisodes) {
        super(title, genre, duration);
        this.numberOfEpisodes = numberOfEpisodes;
    }

    showInformation() {
        return {
            title: this.title,
            genre: this.genre,
            duration: this.duration,
            numberOfEpisodes: this.numberOfEpisodes
        };
    }

    play() {
        return "Playing next episode automatically.";
    }
}

class Documentary extends StreamingContent {

    constructor(title, genre, duration, topic) {
        super(title, genre, duration);
        this.topic = topic;
    }

    showInformation() {
        return {
            title: this.title,
            genre: this.genre,
            duration: this.duration,
            topic: this.topic
        };
    }

    play() {
        return "Playing educational documentary.";
    }
}

// Creating objects
const movie = new Movie(
    "Interstellar", 
    "Science fiction",
    169,
    "Christopher Nolan"
);

const serie = new Serie(
    "Breaking Bad",
    "Crime Drama",
    50,
    62
);

const documentary = new Documentary(
    "planet Earth",
    "Nature",
    60,
    "Wildlife"
)

// array of content
const platformContent = [movie, serie, documentary]

// Applying a loop to display the information
for (const content of platformContent) {
    console.log("+++++++++++++++++++++++++++");
    console.log(content.showInformation());
    console.log(content.play());
    console.log("+++++++++++++++++++++++++++");
}