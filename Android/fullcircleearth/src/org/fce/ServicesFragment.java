//
//  AboutFragment.java
//
//  Copyright (c) 2014 Nexage. All rights reserved.
//

package org.fce;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

public class ServicesFragment extends Fragment {

	private static final String TAG = "Services";
	private WebView myWebView;
	
	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		Log.v(TAG, "Called onActivityCreated");
		
	}
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View rootView = inflater.inflate(R.layout.fragment_services, container,
				false);

		Log.v(TAG, "Called onCreateView");

		// Load webview with a text
		myWebView = (WebView) rootView.findViewById(R.id.webview);
		myWebView.loadUrl("file:///android_res/raw/services.html");

		return rootView;
	}

}
