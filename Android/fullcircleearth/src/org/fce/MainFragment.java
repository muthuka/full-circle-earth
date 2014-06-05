//
//  AboutFragment.java
//
//  Copyright (c) 2014 Nexage. All rights reserved.
//

package org.fce;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MainFragment extends Fragment {

	private static final String TAG = "Main";
	private ListView lv;

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		Log.v(TAG, "Called onActivityCreated");
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		View rootView = inflater.inflate(R.layout.fragment_main, container, false);

		lv = (ListView) rootView.findViewById(R.id.lv);

		Log.v(TAG, "Called onCreateView");

		ArrayList<Item> a = new ArrayList<Item>();
		ArrayAdapter<Item> adapter = new ArrayAdapter<Item>(getActivity(), R.layout.list_item, R.id.title, a);

		lv.setAdapter(adapter);
		lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
			public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				Item item = (Item) parent.getItemAtPosition(position);
				// When clicked, show a toast with the TextView text
				Toast.makeText(getActivity(), "Opening browser", Toast.LENGTH_SHORT).show();
				
				Intent intent = new Intent(getActivity(), WebViewActivity.class);
				intent.putExtra("url", item.getLink());
			    startActivity(intent);
//				startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(item.getLink())));
			}
		});

		// Show alert
		

		new RequestTask().execute("http://www.fullcircleearth.org/?feed=rss2");

		return rootView;
	}

	@Override
	public void onDestroy() {
    	if (pd!=null) {
			pd.dismiss();
		}
    	super.onDestroy();
    }
	
	private ProgressDialog pd;
	private class RequestTask extends AsyncTask<String, String, String> {

		@Override
		protected void onPreExecute() {
			pd = new ProgressDialog(getActivity());
			pd.setTitle("Downloading Blog...");
			pd.setMessage("Please wait.");
			pd.setCancelable(false);
			pd.setIndeterminate(true);
			pd.show();
		}
		
		protected String doInBackground(String... uri) {
			String feedString = null;
			try {
				DefaultHttpClient httpClient = new DefaultHttpClient();
				HttpGet httpGet = new HttpGet(uri[0]);

				HttpResponse httpResponse = httpClient.execute(httpGet);
				StatusLine statusLine = httpResponse.getStatusLine();
				if (statusLine.getStatusCode() == HttpStatus.SC_OK) {
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					httpResponse.getEntity().writeTo(out);
					out.close();
					feedString = out.toString();
				} else {
					// Closes the connection.
					httpResponse.getEntity().getContent().close();
					throw new IOException(statusLine.getReasonPhrase());
				}
			} catch (Exception e) {
				Log.v(TAG, e.getLocalizedMessage());
			}
			return feedString;
		}

		protected void onPostExecute(String result) {
			super.onPostExecute(result);
			
			if (pd!=null) {
				pd.dismiss();
			}

			XMLParser parser = new XMLParser();
			Feed feed = parser.getFeed(result);
			ArrayList<Item> data = feed.getItems();

			// setup the data adaptor
			ArrayAdapter<Item> adapter = new ArrayAdapter<Item>(getActivity(), R.layout.list_item, R.id.title, data);
			// specify the list adaptor
			lv.setAdapter(adapter);
		}
	}

}
