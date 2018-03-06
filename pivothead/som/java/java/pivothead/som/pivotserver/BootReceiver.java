package pivothead.som.pivotserver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Created by user on 2018/3/2.
 */

public class BootReceiver extends BroadcastReceiver {
    private final static String TAG = BootReceiver.class.getSimpleName();

    @Override
    public void onReceive(Context context, Intent intent) {
        String package_root = context.getFilesDir().getAbsolutePath();
        String app_root =  package_root;
        Intent ix = new Intent(context, ServiceWebservice.class);
        ix.putExtra("androidPrivate", package_root);
        ix.putExtra("androidArgument", app_root);
        ix.putExtra("pythonName", "webservice");
        ix.putExtra("pythonHome", app_root);
        ix.putExtra("pythonPath", package_root);
        ix.putExtra("pythonServiceArgument", "webservice:/service/main.py");
        ix.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startService(ix);
    }
}
