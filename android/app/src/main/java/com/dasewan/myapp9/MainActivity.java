package com.dasewan.myapp9;

import android.graphics.Color;
import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.AppOpsManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import io.flutter.Log;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;

/**
 * @author dasewan
 */
public class MainActivity extends FlutterActivity {

  private static final String TAG = "MainActivity";
  private static final String BATTERY_CHANNEL = "samples.flutter.io/battery";
  private static final String CHARGING_CHANNEL = "samples.flutter.io/charging";
  private static final int PERMISSION_REQUEST_CODE = 1;
  private LocationManager locationManager;
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);
    flutterEngine.getPlugins().add(new InstallAPKPlugin(this));

    new EventChannel(flutterEngine.getDartExecutor(), CHARGING_CHANNEL).setStreamHandler(
            new StreamHandler() {
              private BroadcastReceiver chargingStateChangeReceiver;
              @Override
              public void onListen(Object arguments, EventSink events) {
                chargingStateChangeReceiver = createChargingStateChangeReceiver(events);
                registerReceiver(
                        chargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
              }

              @Override
              public void onCancel(Object arguments) {
                unregisterReceiver(chargingStateChangeReceiver);
                chargingStateChangeReceiver = null;
              }
            }
    );

    new MethodChannel(flutterEngine.getDartExecutor(), BATTERY_CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {

              @Override
              public void onMethodCall(MethodCall call, Result result) {
                if (call.method.equals("getBatteryLevel")) {
                  int batteryLevel = getBatteryLevel();
                  if (batteryLevel != -1) {
                    result.success(batteryLevel);
                  } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null);
                  }
                } else if (call.method.equals("getSmsList")) {
                  getSMSList(call,result);
//                            SmsHelper.getSmsList();

                } else if (call.method.equals("hasPermission")) {
                  hasPermission(call,result);
//                            SmsHelper.getSmsList();

                } else if (call.method.equals("requestPermission")) {
                  requestPermission(call,result);
//                            SmsHelper.getSmsList();
//
                }  else if (call.method.equals("checkOpsPermission")) {
                  checkOpsPermission(call,result);
//                            SmsHelper.getSmsList();

                }   else if (call.method.equals("serviceIsOn")) {
                  checkOpsPermission(call,result);
//                            SmsHelper.getSmsList();

                }   else if (call.method.equals("getLocation")) {
                  getLocation(result);
//                            SmsHelper.getSmsList();

                }      else {
                  result.notImplemented();
                }
              }
            }
    );
  }

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    /// 设置状态栏透明，导航栏沉浸。
//    getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
    getWindow().setStatusBarColor(Color.TRANSPARENT);
  }

  @Override
  public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    super.onRequestPermissionsResult(requestCode, permissions, grantResults);
    Log.e(TAG, "+++++++++++++++++++++++++++++++3333333333333+++++++++++++++++");
    Log.e(TAG, requestCode + "");
    Map<String, Object> result = new HashMap<>();
    if (requestCode == 1) {
      Log.e(TAG, grantResults.length + "");
      for (int grant :
              grantResults) {
        Log.e(TAG, grant +"");
      }

      if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
        Log.e(TAG, "++++++++++++++++++++++授权成功+++++++++++++++++++++++++++");
        result.put("grantResults", true);

        new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), BATTERY_CHANNEL).invokeMethod("requestPermission", result);
      } else {
        result.put("grantResults", false);
        Log.e(TAG, "++++++++++++++++++++++授权失败+++++++++++++++++++++++++++");
        new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), BATTERY_CHANNEL).invokeMethod("requestPermission", result);
      }
    }
  }

  private BroadcastReceiver createChargingStateChangeReceiver(final EventSink events) {
    return new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);

        if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
          events.error("UNAVAILABLE", "Charging status unavailable", null);
        } else {
          boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                  status == BatteryManager.BATTERY_STATUS_FULL;
          events.success(isCharging ? "charging" : "discharging");
        }
      }
    };
  }

  private int getBatteryLevel() {
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).
              registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      return (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
              intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }
  }

  public void getSMSList(MethodCall call,MethodChannel.Result result) {
    Long start = call.argument("start");
    Log.e(TAG, "+++++++++++++++++++++++++++++++++++++++++++++++++");
    Log.e(TAG, "+++++++++++++++++++++++++++++++++++++++++++++++++");
    Date startDate = new Date(start);
    String[] projection = {"address", "body", "date"};
    String selection = "date>=?";
    Log.e(TAG, startDate.getTime() + "");

    String[] selectionArgs = {startDate.getTime() + ""};

    Cursor cursor = getContentResolver().query(
            Uri.parse("content://sms/inbox"),
            null, selection, selectionArgs, "date desc");
    List<Map<String, String>> messages = new ArrayList<>();

    if (cursor.moveToFirst()) { // must check the result to prevent exception
      do {
        Map<String, String> message = new HashMap<>();
        message.put("address", cursor.getString(cursor.getColumnIndex("address")));
        message.put("body", cursor.getString(cursor.getColumnIndex("body")));
        message.put("type", cursor.getString(cursor.getColumnIndex("type")));
        message.put("thread_id", cursor.getString(cursor.getColumnIndex("thread_id")));
        message.put("date", cursor.getString(cursor.getColumnIndex("date")));
        message.put("date_sent", cursor.getString(cursor.getColumnIndex("date_sent")));
        message.put("read", cursor.getString(cursor.getColumnIndex("read")));
        message.put("seen", cursor.getString(cursor.getColumnIndex("seen")));
        message.put("status", cursor.getString(cursor.getColumnIndex("status")));
        messages.add(message);
      } while (cursor.moveToNext());
    }
    cursor.close();

    result.success(messages);
  }

  public void hasPermission(MethodCall call,MethodChannel.Result result) {
    Context context = getContext();
    Log.e(TAG, context.toString());
    String permissionType = call.argument("type");
    assert permissionType != null;
    int permissionCheck;
    if(permissionType.equals("sms")){
      permissionCheck = ContextCompat.checkSelfPermission(context, Manifest.permission.READ_SMS);
    }else if(permissionType.equals("contacts")){
      permissionCheck = ContextCompat.checkSelfPermission(context, Manifest.permission.READ_CONTACTS);
    }else{
      permissionCheck = ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_COARSE_LOCATION);
    }

    boolean messages = false;
    if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
      // 已经授权
      Log.e(TAG, "+++++++++++++++++++++++++++++++++++++++++++++++++");
      Log.e(TAG, "+++++++++++++++++++++已经授权++++++++++++++++++++++++++++");
      messages = true;
    } else {
      // 没有授权
      Log.e(TAG, "+++++++++++++++++++++++++++++++++++++++++++++++++");
      Log.e(TAG, "++++++++++++++++++++++没有授+++++++++++++++++++++++++++");
    }
    result.success(messages);
  }

  public void requestPermission(MethodCall call,MethodChannel.Result result) {
    Context context = getContext();
    Log.e(TAG, context.toString());
    String permissionType = call.argument("type");
    assert permissionType != null;
    int permissionCheck;
    if(permissionType.equals("sms")){
      permissionCheck = ContextCompat.checkSelfPermission(context, Manifest.permission.READ_SMS);
    }else{
      permissionCheck = ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_COARSE_LOCATION);
    }

    boolean messages = false;
    if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
      // 已经授权
      Log.e(TAG, "+++++++++++++++++++++++++++++++++++++++++++++++++");
      Log.e(TAG, "+++++++++++++++++++++已经授权22222++++++++++++++++++++++++++++");
      messages = true;
      result.success(messages);
    } else {
      // 没有授权
      Log.e(TAG, "+++++++++++++++++++++++++++++++++++++++++++++++++");
      Log.e(TAG, "++++++++++++++++++++++没有授222222+++++++++++++++++++++++++++");
      if (ContextCompat.checkSelfPermission(context, Manifest.permission.READ_SMS) != PackageManager.PERMISSION_GRANTED) {
        Log.e(TAG, "++++++++++++++++++++++没有授2222222222+++++++++++++++++++++++++++");
        ActivityCompat.requestPermissions(this, new String[]{ Manifest.permission.READ_SMS}, 1);
        Log.e(TAG, "++++++++++++++++++++++没有授222222222222222+++++++++++++++++++++++++++");
      }
    }
  }


  private void checkOpsPermission(MethodCall call, MethodChannel.Result result) {
    try {
      Context context = getContext();
      AppOpsManager appOpsManager = null;
      if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT) {
        appOpsManager = (AppOpsManager) context.getSystemService(Context.APP_OPS_SERVICE);
      }
      String opsName = null;
      if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
        opsName = AppOpsManager.permissionToOp(Manifest.permission.READ_SMS);
      }
      if (opsName == null) {
        result.success(true);
      }
      int opsMode = 0;
      if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT) {
        opsMode = appOpsManager.checkOpNoThrow(opsName, android.os.Process.myUid(), context.getPackageName());
      }
      result.success(opsMode == AppOpsManager.MODE_ALLOWED);
    } catch (Exception ex) {
      result.success(true);
    }
  }
  private void serviceIsOn(MethodCall call, MethodChannel.Result result) {
    try {
      Context context = getContext();
      String serviceType = call.argument("type");
      assert serviceType != null;
      boolean isOn;
      if(serviceType.equals("location")){
        isOn = isLocationEnabled();;
      }else{
        isOn = false;
      }
      result.success(isOn);
    } catch (Exception ex) {
      result.success(true);
    }
  }

  private boolean isLocationEnabled() {
    LocationManager locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
    return locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER) || locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER);
  }

  @SuppressLint("MissingPermission")
  private void getLocation(MethodChannel.Result result) {
    locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);

    if (ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
      ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, PERMISSION_REQUEST_CODE);
    } else {
      LocationListener locationListener = new LocationListener() {
        @Override
        public void onLocationChanged(Location location) {
          double latitude = location.getLatitude();
          double longitude = location.getLongitude();
          result.success(latitude + "," + longitude);
        }

        @Override
        public void onStatusChanged(String provider, int status, Bundle extras) {

        }


        @Override
        public void onProviderEnabled(String provider) {
        }

        @Override
        public void onProviderDisabled(String provider) {
        }
      };

      locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, locationListener);
    }
  }

  private List<Map<String, Object>> getInstalledApps() {
    Context context = getContext();
    PackageManager packageManager = context.getPackageManager();
    List<PackageInfo> packages = packageManager.getInstalledPackages(0);
    List<Map<String, Object>> installedApps = new ArrayList<>(packages.size());
    for (PackageInfo pkg : packages) {
      Map<String, Object> map = convertPackageInfoToJson(pkg);
      installedApps.add(map);
    }
    return installedApps;
  }

  private Map<String, Object> convertPackageInfoToJson(PackageInfo info) {
    Context context = getContext();
    Map<String, Object> app = new HashMap<>();
    app.put("app_name", info.applicationInfo.loadLabel(context.getPackageManager()).toString());
    app.put("package_name", info.packageName);
    app.put("version_name", info.versionName);
    app.put("system_app", (info.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) != 0);
    return app;
  }
}
