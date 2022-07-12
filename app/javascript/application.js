// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";

const request = (method, url, body = false, params = false) =>
  fetch(url, {
    method,
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
    },
    params: params ? new URLSearchParams(params) : undefined,
    body: body ? JSON.stringify(body) : undefined,
  }).then((response) => {
    if (response.ok) {
      return Promise.resolve(response.json());
    }

    const error = new Error("Not 2xx response");
    error.response = response;
    throw error;
  });

const bindSearchLyrics = () => {
  const searchLyricsButton = document.querySelector(".musics-btn-fetch-lyrics");

  if (!searchLyricsButton) {
    return;
  }

  searchLyricsButton.addEventListener("click", (e) => {
    e.preventDefault();

    const button = e.target;
    const { target } = button.dataset;
    const title = document.querySelector("input#music_name");
    const artist = document.querySelector("input#music_author");

    if (!title || !artist) {
      return alert("Preencha o nome e o artista primeiro.");
    }

    button.classList.add("btn-loading");

    request("post", "/api/v1/musics/lyrics", {
      music: {
        artist: artist.value,
        title: title.value,
      },
    })
      .then(({ lyrics }) => {
        document.querySelector(target).value = lyrics;
      })
      .catch((error) => {
        console.error(error);
        alert("Nenhuma letra encontrada para esse titulo + artista.");
      })
      .finally(() => {
        button.classList.remove("btn-loading");
      });
  });
};

const bindSearchChords = () => {
  const searchChordsButtons = document.querySelector(
    ".musics-btn-fetch-chords"
  );

  if (!searchChordsButtons) {
    return;
  }

  searchChordsButtons.addEventListener("click", (e) => {
    e.preventDefault();

    const button = e.target;
    const { target } = button.dataset;
    const title = document.querySelector("input#music_name");
    const artist = document.querySelector("input#music_author");

    if (!title || !artist) {
      return alert("Preencha o nome e o artista primeiro.");
    }

    button.classList.add("btn-loading");

    request("post", "/api/v1/musics/chords", {
      music: {
        artist: artist.value,
        title: title.value,
      },
    })
      .then(({ chords }) => {
        document.querySelector(target).value = chords;
      })
      .catch((error) => {
        console.error(error);
        alert("Nenhuma letra encontrada para esse titulo + artista.");
      })
      .finally(() => {
        button.classList.remove("btn-loading");
      });
  });
};

document.addEventListener("turbo:load", () => {
  bindSearchLyrics();
  bindSearchChords();
});
