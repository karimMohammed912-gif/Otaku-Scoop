
import 'package:otaku_scope/core/utils/enums.dart';

class Querys {
  String getAnimeDetailsQuery(int id) {
    return '''query {
  Media(id:$id, type: ANIME) {
    
    title {
      romaji
      english
    }
    startDate {
      year
      month
      day
    }endDate {
      
    
      year
      month
      day
    }
    description(asHtml: false)
    episodes
    duration
    status
    genres
    averageScore
    
    coverImage {
      large
    }
    bannerImage
    characters (perPage: 10) {
      edges {
        node {
          name {
            full
          }
          image {
            large
          }
        }
        id
        name
      }
    }
  }
}
''';
  }

   String getTopAnimeQuery({required int perPage,required int page, required TopAnimeCategory category}) {

    
    String categoryFilter;
    String sort = 'POPULARITY_DESC';
    switch (category) {
      case TopAnimeCategory.movies:
        categoryFilter = 'format: MOVIE';
        break;
      case TopAnimeCategory.tv:
        categoryFilter = 'format: TV';
        break;
      case TopAnimeCategory.upcoming:
        categoryFilter = 'status: NOT_YET_RELEASED';
        sort = 'START_DATE';
        break;
    }
    return '''
 query {
  Page(perPage: $perPage, page: $page) {
    media(sort: $sort, type: ANIME, $categoryFilter) {
      id
      title {
        english
        romaji
      }
      coverImage {
        large
      }
    }    pageInfo {
      total
      perPage
      lastPage
      hasNextPage
      currentPage
    }
  }
}
  ''';
  }
  String getSeasonalAnimeQuery(int page, {required String season}) {
    return '''query {
  Page(perPage: 50, page: $page) {
    media(season: $season,isAdult: false, seasonYear: ${DateTime.now().year}, type: ANIME, sort: POPULARITY_DESC) {
      id
      title {
        romaji
        english
      }
      coverImage {
        large
      }
      episodes
      averageScore
    }
     pageInfo {
      total
      perPage
      lastPage
      hasNextPage
      currentPage
    }
  }
}
''';
  }

  String getLatestUpdateQuery( int page) {
    return '''query {
  Page(perPage: 50, page: $page) {
   media(sort: EPISODES, type: ANIME, status: RELEASING,isAdult: false, seasonYear: 2025)
         {
      id
      title {
        romaji
        english
      }
      coverImage {
        large
      }
      episodes
      averageScore
    }
      pageInfo {
      total
      perPage
      lastPage
      hasNextPage
      currentPage
    }
  }
}''';
  }


    String getAnimeTrendingQuery( int page) {

    return '''query {
  Page(perPage: 10, page: $page) {
    media(sort: TRENDING_DESC, type: ANIME) {
      id
      title {
        romaji
        english
      }
      trending
      coverImage {
        large
      }
    }
  }
}
''';
  }

  String getRecommendationAnimeQuery(int id, int page) {
    return '''query {
  Media(id: $id, type: ANIME, page: $page) {
    recommendations (sort: RATING_DESC, perPage: 50) {
      edges {
        node {
          mediaRecommendation {
            id
            title {
              romaji
              english
            }
            coverImage {
              large
            }
            averageScore
          }
        }
      }
    }
  }
}''';
  }


 String getTopMangaQuery( {required int page, required TopMangaCategory category}) {

    String categoryFilter;

    switch (category) {
      case TopMangaCategory.manga:
        categoryFilter = 'format: MANGA';
        break;
      case TopMangaCategory.novels:
        categoryFilter = 'format: NOVEL';

      
        break;
    }
    return '''query {
  Page(perPage: 50, page: $page) {
    media(sort: TRENDING_DESC,isAdult: false, type: MANGA, $categoryFilter) {
      id
      title {
        romaji
        english
      }
      trending
      coverImage {
        large
      }
    }pageInfo {
      total
      perPage
      lastPage
      hasNextPage
      currentPage
    }
  }
}
''';
  }

  String getLatestMangaQuery(int page) {
    return '''query {
  Page(perPage: 50, page: $page) {
    media(type: MANGA,isAdult: false, sort: UPDATED_AT_DESC) {
      id
      title {
        romaji
        english
        native
      }
      coverImage {
        large
      }
      updatedAt
      status
      chapters
      volumes
    }pageInfo {
      total
      perPage
      lastPage
      hasNextPage
      currentPage
    }
  }
}
''';
  } }