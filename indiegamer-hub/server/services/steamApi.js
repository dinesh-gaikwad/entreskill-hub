const fetchGameFromSteam = async (appid) => {
  return {
    appid,
    title: '',
    price: null,
    releaseDate: null,
    tags: []
  };
};

module.exports = { fetchGameFromSteam };
