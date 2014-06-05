//
//  AboutFragment.java
//
//  Copyright (c) 2014 Nexage. All rights reserved.
//

package org.fce;

import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class AboutFragment extends Fragment {

	private static final String TAG = "About";
	private TextView version;
	
	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		Log.v(TAG, "Called onActivityCreated");
		
		String versionName = "";
		
		try {
			versionName = getActivity().getPackageManager().getPackageInfo(
					getActivity().getPackageName(), 0).versionName;
			
		} catch (NameNotFoundException e) {
			e.printStackTrace();
		}

		// Set versions
		version.setText("v" + versionName);
		
	}
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View rootView = inflater.inflate(R.layout.fragment_about, container,
				false);

		Log.v(TAG, "Called onCreateView");
		version = (TextView) rootView.findViewById(R.id.versionNumber);

		return rootView;
	}

}
