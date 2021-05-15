public class Utility
{
   public static String GetAccountNameFromTaskId(String taskid)
    {
        String account = taskid.Substring(0, taskid.LastIndexOf('/'));
        return account;
    }
    public static String GetPolicyIdFromTaskId(String taskid)
    {
        String policyId = taskid.Substring(taskid.LastIndexOf('/')+1);
        return policyId;
    }

    public static String GetEnvironmentName(String Tenant)
    {
        String environment = "unknown"

        switch (Tenant)
        {
            case Tenant.Trim().ToLower().StartsWith("ms"):
                environment = "Production";
                break;
            case Tenant.Trim().ToLower().StartsWith("FD"):
                environment = "Fairfax";
                break;
            case Tenant.Trim().ToLower().StartsWith("MC"):
                environment = "Mooncake";
                break;
            default:
                environment = "Unknown";
                break;
        }

        return environment;
    }
}