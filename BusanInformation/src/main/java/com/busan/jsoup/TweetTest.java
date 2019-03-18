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
		.setOAuthConsumerKey("FGn7jhXosW5DIYVfB0Sbz2e3R")
		.setOAuthConsumerSecret("iIsSr0L7vzzQvzGVv02df2p0KAgytOpDYgFtfXhBJhBtWpqJk1")
		.setOAuthAccessToken("1105447582434701312-p1NSSnNz7kZ9ygRuQbSpmEtSmNAKsz")
		.setOAuthAccessTokenSecret("bAFIXyAmgmpz5v4j7eb7N9JgBq0TJtOhofs8SyfjGIKZy");
		
		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();
		
		Query query = new Query("해운대여행");
		QueryResult result = null;
		
		try {
			result = twitter.search(query);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("서면맛집 : "+result.getTweets().size());
		for(Status status : result.getTweets()) {
			System.out.println("트위터 내용 : "+status.getText());
			System.out.println("리트윗 횟수 : "+status.getRetweetCount());
		}
		

	}

}
