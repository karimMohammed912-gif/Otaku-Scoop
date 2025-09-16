
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
  Page(perPage: 10, page: 1) {
    media(season: $season, seasonYear: 2025, type: ANIME, sort: POPULARITY_DESC) {
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
  Page(perPage: 10, page: $page) {
    media(sort: UPDATED_AT_DESC, type: ANIME) {
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

  String getRecommendationAnimeQuery(int id) {
    return '''query {
  Media(id: $id, type: ANIME) {
    recommendations (sort: RATING_DESC, perPage: 10) {
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


}
