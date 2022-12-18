// To parse this JSON data, do
//
//     final chart = chartFromJson(jsonString);

import 'dart:convert';

Chart chartFromJson(String str) => Chart.fromJson(json.decode(str));

String chartToJson(Chart data) => json.encode(data.toJson());

class Chart {
    Chart({
        required this.chart,
    });

    ChartClass chart;

    factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        chart: ChartClass.fromJson(json["chart"]),
    );

    Map<String, dynamic> toJson() => {
        "chart": chart.toJson(),
    };
}

class ChartClass {
    ChartClass({
        required this.result,
        this.error,
    });

    List<Result> result;
    dynamic error;

    factory ChartClass.fromJson(Map<String, dynamic> json) => ChartClass(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "error": error,
    };
}

class Result {
    Result({
        required this.meta,
        required this.timestamp,
        required this.indicators,
    });

    Meta meta;
    List<int> timestamp;
    Indicators indicators;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        meta: Meta.fromJson(json["meta"]),
        timestamp: List<int>.from(json["timestamp"].map((x) => x)),
        indicators: Indicators.fromJson(json["indicators"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "timestamp": List<dynamic>.from(timestamp.map((x) => x)),
        "indicators": indicators.toJson(),
    };
}

class Indicators {
    Indicators({
        required this.quote,
    });

    List<Quote> quote;

    factory Indicators.fromJson(Map<String, dynamic> json) => Indicators(
        quote: List<Quote>.from(json["quote"].map((x) => Quote.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "quote": List<dynamic>.from(quote.map((x) => x.toJson())),
    };
}

class Quote {
    Quote({
        required this.high,
        required this.close,
        required this.low,
        required this.volume,
        required this.open,
    });

    List<double> high;
    List<double> close;
    List<double> low;
    List<int> volume;
    List<double> open;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        high: List<double>.from(json["high"].map((x) => x.toDouble())),
        close: List<double>.from(json["close"].map((x) => x.toDouble())),
        low: List<double>.from(json["low"].map((x) => x.toDouble())),
        volume: List<int>.from(json["volume"].map((x) => x)),
        open: List<double>.from(json["open"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "high": List<dynamic>.from(high.map((x) => x)),
        "close": List<dynamic>.from(close.map((x) => x)),
        "low": List<dynamic>.from(low.map((x) => x)),
        "volume": List<dynamic>.from(volume.map((x) => x)),
        "open": List<dynamic>.from(open.map((x) => x)),
    };
}

class Meta {
    Meta({
        required this.currency,
        required this.symbol,
        required this.exchangeName,
        required this.instrumentType,
        required this.firstTradeDate,
        required this.regularMarketTime,
        required this.gmtoffset,
        required this.timezone,
        required this.exchangeTimezoneName,
        required this.regularMarketPrice,
        required this.chartPreviousClose,
        required this.previousClose,
        required this.scale,
        required this.priceHint,
        required this.currentTradingPeriod,
        required this.tradingPeriods,
        required this.dataGranularity,
        required this.range,
        required this.validRanges,
    });

    String currency;
    String symbol;
    String exchangeName;
    String instrumentType;
    int firstTradeDate;
    int regularMarketTime;
    int gmtoffset;
    String timezone;
    String exchangeTimezoneName;
    double regularMarketPrice;
    double chartPreviousClose;
    double previousClose;
    int scale;
    int priceHint;
    CurrentTradingPeriod currentTradingPeriod;
    List<List<Post>> tradingPeriods;
    String dataGranularity;
    String range;
    List<String> validRanges;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currency: json["currency"],
        symbol: json["symbol"],
        exchangeName: json["exchangeName"],
        instrumentType: json["instrumentType"],
        firstTradeDate: json["firstTradeDate"],
        regularMarketTime: json["regularMarketTime"],
        gmtoffset: json["gmtoffset"],
        timezone: json["timezone"],
        exchangeTimezoneName: json["exchangeTimezoneName"],
        regularMarketPrice: json["regularMarketPrice"].toDouble(),
        chartPreviousClose: json["chartPreviousClose"].toDouble(),
        previousClose: json["previousClose"].toDouble(),
        scale: json["scale"],
        priceHint: json["priceHint"],
        currentTradingPeriod: CurrentTradingPeriod.fromJson(json["currentTradingPeriod"]),
        tradingPeriods: List<List<Post>>.from(json["tradingPeriods"].map((x) => List<Post>.from(x.map((x) => Post.fromJson(x))))),
        dataGranularity: json["dataGranularity"],
        range: json["range"],
        validRanges: List<String>.from(json["validRanges"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "currency": currency,
        "symbol": symbol,
        "exchangeName": exchangeName,
        "instrumentType": instrumentType,
        "firstTradeDate": firstTradeDate,
        "regularMarketTime": regularMarketTime,
        "gmtoffset": gmtoffset,
        "timezone": timezone,
        "exchangeTimezoneName": exchangeTimezoneName,
        "regularMarketPrice": regularMarketPrice,
        "chartPreviousClose": chartPreviousClose,
        "previousClose": previousClose,
        "scale": scale,
        "priceHint": priceHint,
        "currentTradingPeriod": currentTradingPeriod.toJson(),
        "tradingPeriods": List<dynamic>.from(tradingPeriods.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "dataGranularity": dataGranularity,
        "range": range,
        "validRanges": List<dynamic>.from(validRanges.map((x) => x)),
    };
}

class CurrentTradingPeriod {
    CurrentTradingPeriod({
        required this.pre,
        required this.regular,
        required this.post,
    });

    Post pre;
    Post regular;
    Post post;

    factory CurrentTradingPeriod.fromJson(Map<String, dynamic> json) => CurrentTradingPeriod(
        pre: Post.fromJson(json["pre"]),
        regular: Post.fromJson(json["regular"]),
        post: Post.fromJson(json["post"]),
    );

    Map<String, dynamic> toJson() => {
        "pre": pre.toJson(),
        "regular": regular.toJson(),
        "post": post.toJson(),
    };
}

class Post {
    Post({
        required this.timezone,
        required this.start,
        required this.end,
        required this.gmtoffset,
    });

    String timezone;
    int start;
    int end;
    int gmtoffset;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        timezone: json["timezone"],
        start: json["start"],
        end: json["end"],
        gmtoffset: json["gmtoffset"],
    );

    Map<String, dynamic> toJson() => {
        "timezone": timezone,
        "start": start,
        "end": end,
        "gmtoffset": gmtoffset,
    };
}
