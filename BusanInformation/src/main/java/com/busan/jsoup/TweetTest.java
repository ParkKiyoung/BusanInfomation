package com.busan.jsoup;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class TweetTest {

	public static void main(String[] args) {
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		.setOAuthConsumerKey("키")
		.setOAuthConsumerSecret("컨")
		.setOAuthAccessToken("토큰")
		.setOAuthAccessTokenSecret("키");
		
		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();
		
		Query query = new Query("해운대");
		QueryResult result = null;
		
		try {
			result = twitter.search(query);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("해운대 : "+result.getTweets().size());
		for(Status status : result.getTweets()) {
			System.out.println("트위터 내용 : "+status.getText());
			System.out.println("리트윗 횟수 : "+status.getRetweetCount());
		}
		

	}

}
