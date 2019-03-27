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
		.setOAuthConsumerKey("Ű")
		.setOAuthConsumerSecret("��")
		.setOAuthAccessToken("��ū")
		.setOAuthAccessTokenSecret("Ű");
		
		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();
		
		Query query = new Query("�ؿ��");
		QueryResult result = null;
		
		try {
			result = twitter.search(query);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("�ؿ�� : "+result.getTweets().size());
		for(Status status : result.getTweets()) {
			System.out.println("Ʈ���� ���� : "+status.getText());
			System.out.println("��Ʈ�� Ƚ�� : "+status.getRetweetCount());
		}
		

	}

}
