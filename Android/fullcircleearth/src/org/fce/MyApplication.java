package org.fce;

import android.app.Application;

import com.urbanairship.UAirship;
import com.urbanairship.push.PushManager;

public class MyApplication extends Application {

	@Override
	public void onCreate() {
		UAirship.takeOff(this, null);
		PushManager.enablePush();
	}
}